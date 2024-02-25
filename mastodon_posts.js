const fs = require('fs')
const fetch = require('node-fetch')
const unionBy = require('lodash/unionBy')
require('dotenv').config()
const fsPromises = require("fs/promises");

const CACHE_FILE_PATH_MINE = '_cache/mastodon_posts.json'
const API = 'https://ruby.social/api'

async function fetchMyToots(sinceId, perPage = 40) {
  let url = `${API}/v1/accounts/109523806417662780/statuses?exclude_replies=1&exclude_reblogs=1&limit=${perPage}`
  if (sinceId) url += `&since_id=${sinceId}` // only fetch new mentions

  const response = await fetch(url)
  if (response.ok) {
    const feed = await response.json()
    let feedWithContext = []
    for (let i = 0; i < feed.length; i++) {
      const toot = feed[i];
      let url2 = `${API}/v1/statuses/${toot.id}/context`
      console.log(`>>> Getting context of ${toot.id}`)
      const response2 = await fetch(url2)
      if (response2.ok) {
        let tootWithContext = toot;
        tootWithContext.context = await response2.json();
        feedWithContext.push(tootWithContext);
      } else {
        feedWithContext.push(toot);
      }
    }

    console.log(`>>> ${feedWithContext.length} new toots fetched from ${API}`)
    return feedWithContext
  }

  return null
}

function mergeToots(a, b) {
  return unionBy(a, b, 'id')
}

async function writeJSONToCache(cacheFileName, data) {
  const dir = '_cache'
  const fileContent = JSON.stringify(data, null, 2)
  if (!fs.existsSync(dir)) { fs.mkdirSync(dir) }

  await fsPromises.writeFile(cacheFileName, fileContent)
  console.log(`>>> Toots cached to ${cacheFileName}`)
}

function readTootsFromCache(cacheFileName) {
  if (fs.existsSync(cacheFileName)) {
    const cacheFile = fs.readFileSync(cacheFileName)
    return JSON.parse(cacheFile)
  }

  return { children: [] }
}

console.log('>>> Reading toots from cache...');
const cache = readTootsFromCache(CACHE_FILE_PATH_MINE)
console.log(`>>> ${cache.children.length} toots loaded from cache`)

var d = new Date();
d.setMonth(d.getMonth()-1);
const oldToots = cache.children.filter(toot => Date.parse(toot.created_at) < d)
const youngestOldTood = oldToots.reduce((result, currentToot) => {
  if (Date.parse(result.created_at) < Date.parse(currentToot.created_at)) {
    result = currentToot
  }
  return result
}, oldToots[0])

console.log(`>>> Checking for new toots... (new once since ${youngestOldTood && youngestOldTood.id} - the newest toot older than a month)`);
fetchMyToots(youngestOldTood && youngestOldTood.id).then(
  feed => {
    if (feed) {
      const myToots = {
        lastFetchedId: feed[0] && feed[0].id,
        children: mergeToots(feed, oldToots)
      }
      console.log(`>>> Got ${feed.length} new toots. ${myToots.children.length} total...`);

      writeJSONToCache(CACHE_FILE_PATH_MINE, myToots);
    }
  },
  err => {
      console.log("Fetching toots failed.")
  }
);
