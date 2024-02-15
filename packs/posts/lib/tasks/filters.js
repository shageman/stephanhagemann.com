const sanitizeHTML = require('sanitize-html')

const rootUrl = require('../_data/metadata').url
const events = require('../_data/events.js')
const talks = require('../_data/talks.js')

const yearDisplay = (date, part) => {
  var d = new Date(date);

  return d.getUTCFullYear();
};

const dateDisplay = (date, part) => {
  var d = new Date(date);
  if (part == 'year') {
    return d.getUTCFullYear();
  }
  var month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  var ordinal = {
    1: "st",
    2: "nd",
    3: "rd",
    21: "st",
    22: "nd",
    23: "rd",
    31: "st"
  };
  return month[d.getMonth()] + " " + d.getDate() + (ordinal[d.getDate()] || "th") + " " + d.getUTCFullYear();
};

const excludedTags = ["all", "nav", "post", "posts"];

const tagListFreq = (collections, tag) => {
  let tagSet = {};
  collections.all.forEach(function (item) {
    if ("tags" in item.data) {
      let tags = item.data.tags.filter(item => !excludedTags.includes(item));

      for (const tag of tags) {
        if (tagSet[tag] == undefined) {
          tagSet[tag] = 1;
        } else {
          tagSet[tag] = tagSet[tag] + 1;
        }
      }
    }
  });

  if (tag) {
    return tagSet[tag];
  } else {
    return tagSet;
  }
};

module.exports = {
  agileLandscapeGraph: () => {
    const fs = require('fs');
    const path = require('path');

    const fileName = 'src/_data/agile_landscape_graph.dot';
    try {
      return fs.readFileSync(path.resolve(fileName), 'utf8');
    } catch (err) {
      console.error('>>>>> Error reading file:', err);
    }
  },
  activeSection: (pageUrl) => {
    if (pageUrl == '/' || pageUrl == '/contact/') {
      return 'root'
    } else if (new RegExp('^\/posts\/.*').test(pageUrl)) {
      return 'posts'
    } else if (new RegExp('^\/books\/.*').test(pageUrl)) {
      return 'books'
    } else if (new RegExp('^\/speaking\/.*').test(pageUrl)) {
      return 'speaking'
    }
  },
  filteredTagList: (collection) => {
    return collection.filter(x => !excludedTags.includes(x));
  },
  tagList: (pages) => {
    return Object.keys(tagListFreq(pages));
  },
  tagListFreq: tagListFreq,
  relFreq: (tagListFreq, tag) => {
    const frequencies = Object.values(tagListFreq);
    const max = Math.max(...frequencies)

    const tagFreq = tagListFreq[tag]
    return Math.round(tagFreq / max * 9) + 1;
  },
  orphanWrap: (text) => {
    if (!text) return;
    let splitSpace = text.split(" ");
    let after = "";
    if (splitSpace.length > 2) {
      after += " ";
      let lastWord = splitSpace.pop();
      let secondLastWord = splitSpace.pop();
      after += `${secondLastWord}&nbsp;${lastWord}`;
    }
    return splitSpace.join(" ") + after;
  },
  dateDisplay: (date, part) => dateDisplay(date, part),
  yearDisplay: (date, part) => yearDisplay(date, part),
  dateTimeDisplay: (date) => {
    time = (new Date(date)).toLocaleTimeString('en-US', {
      timeZone: 'utc',
      timeZoneName: 'short',
      hour12: false,
      hour: 'numeric',
      minute: '2-digit'
    });
    return `${dateDisplay(date)} at ${time}`
  },
  section: (str, section) => {
    var content = new String(str);
    var delimit = "<!--more-->";
    var parts = content.split(delimit);
    var which = section == 'remainder' ? 1 : 0;
    if (parts.length) {
      return parts[which];
    } else {
      return str
    }
  },
  getWebmentionsForUrl: (webmentions, url) => {
    const sanitize = entry => {
      const { content } = entry
      if (content && content.html) {
        content.html = sanitizeHTML(content.html)
      }
      return entry
    }

    return webmentions.children
      .filter(entry => entry['wm-target'].replace(/\/$/, '') === url.replace(/\/$/, ''))
      .map(sanitize)
  },
  isOwnWebmention: (webmention) => {
    const urls = [
      'https://stephanhagemann.com',
      'https://twitter.com/shageman',
      'https://cbra.info'
    ]
    const authorUrl = webmention.author ? webmention.author.url : false
    // check if a given URL is part of this site.
    return authorUrl && urls.some((i) => authorUrl.startsWith(i))
  },
  size: (mentions) => {
    return !mentions ? 0 : mentions.length
  },
  webmentionsByType: (mentions, mentionTypes) => {
    return mentions.filter(entry => mentionTypes.includes(entry['wm-property']))
  },
  sortWebmentions: (mentions) => {
    return mentions.sort((a, b) => {
      if (a["published"] < b["published"]) {
        return -1;
      }
      if (a["published"] > b["published"]) {
        return 1;
      }
      // a must be equal to b
      return 0;
    })
  },
  generateShareLink: (url, text) => {
    const shareText = `${text} by @shageman`
    const shareUrl = `${rootUrl}${url}`
    return `https://twitter.com/intent/tweet/?text=${encodeURI(shareText)}&url=${encodeURI(shareUrl)}`
  },
  generateDiscussionLink: (url) => {
    const postUrl = `${rootUrl}${url}`
    return `https://twitter.com/search?f=tweets&src=typd&q=${encodeURI(postUrl)}`
  },

  getEvents: timing => events[timing],
  getTalkForEvent: id => talks[id],

  truncate: text => text.length > 300 ? `${text.substring(0, 300)}...` : text,
  head: (array, n) => {
    if (n < 0) {
      return array.slice(n);
    }

    return array.slice(0, n);
  },
  sortByDate: (values) => {
    let vals = [...values]; // this *seems* to prevent collection mutation...
    return vals.sort((a, b) => Math.sign(a.data.date - b.data.date));
  }
}