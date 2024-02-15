const fs = require('fs')
const path = require('path');

const agile_landscape_data = require('./src/_data/agile_landscape.js');

function urlForMethodology(obj) {
  return `/agile-landscape/version/${obj.Version.replace(/[^a-zA-Z0-9]/g, '-')}/methodologies/${obj.Methodology.replace(/[^a-zA-Z0-9]/g, '-')}`
}

function urlForEntry(obj) {
  return `/agile-landscape/version/${obj.Version.replace(/[^a-zA-Z0-9]/g, '-')}/entries/${obj.Name.replace(/[^a-zA-Z0-9]/g, '-')}`
}

function getObjectsBySection(data, section) {
  return data.filter(obj => obj.Section === section);
}

function writeDotFile(data) {
  const sections = [...new Set(data.map(obj => obj.Section))];

  var result = ``
  result += `graph {`

  sections.forEach(section => {
    console.log(`Section: ${section}`);
    result += `

  subgraph cluster_${section} {
    color = blue
    label = "${section}"
    fontsize = 60
`

    const sectionObjects = getObjectsBySection(data, section);
    sectionObjects.forEach(obj => {
      result += `
    "${obj.Name}" [URL="${urlForEntry(obj)}"]`
    });
    result += `
  }
`;
  });


  data.forEach(node => {
    if (node['Next 1']) {
      result += `
  "${node.Name}" -- "${node['Next 1']}" [color = "${node.Color}"]`;
    }
    if (node['Next 2']) {
      result += `
  "${node.Name}" -- "${node['Next 2']}" [color = "${node.Color}"]`
    }
  });

  result += `
}
`;

  fs.writeFile('src/_data/agile_landscape_graph.dot', result, (err) => {
    if (err) {
      console.error('Error writing to file:', err);
      return;
    }

    console.log('src/_data/agile_landscape_graph.dot has been written to the file successfully.');
  });
}

function writeEntryContentFiles(data) {
  const entriesByName = new Map();

  data.forEach(entry => {
    const entryName = entry.Name;
    if (!entriesByName.has(entryName)) {
      entriesByName.set(entryName, []);
    }
    entriesByName.get(entryName).push(entry);
  });

  entriesByName.forEach((entries, name) => {
    const node = entries[0]

    const fn = `src/${urlForEntry(node)}.md`;
    const folderPath = path.dirname(fn);
    const fileName = path.basename(fn);

    const justName = encodeURIComponent(`${node.Name}`)
    const methAndName = encodeURIComponent(`${node.Methodology} ${node.Name}`)

    var methodologies = []
    entries.forEach(entry => {
      methodologies.push(`* [${entry.Methodology}](${urlForMethodology(entry)})`)
    });
    methodologies.sort((a, b) => {
      return a.localeCompare(b);
    });

    const fileContent = `---
title: Agile Landscape - Entry - ${node.Name}
header: Agile Landscape - Entry
layout: "layouts/page.njk"
containerClass: content-margin-top
description: This page is part of my <a href="/agile-landscape">Agile Landscape</a> project.
---

# Entry: ${node.Name}

${node.Name} is part of the following methodologies:

${methodologies.join('\n')}

## What ChaptGPT says about it...

${(node && node.chaptGPT && node.chaptGPT[0].result) ?? "Not yet"}

## Google Links

[Google Search for "${node.Name}"](https://www.google.com/search?q=${justName})
[Google Trends for "${node.Name}"](https://trends.google.com/trends/explore?date=all&q=${justName})

[Google Search for "${node.Methodology} ${node.Name}"](https://www.google.com/search?q=${methAndName})
[Google Trends for "${node.Methodology} ${node.Name}"](https://trends.google.com/trends/explore?date=all&q=${methAndName})
`

    fs.mkdir(folderPath, { recursive: true }, (err) => {
      if (err) {
        console.error('Error creating folder:', err);
        return;
      }

      const filePath = path.join(folderPath, fileName);

      fs.writeFile(filePath, fileContent, (err) => {
        if (err) {
          console.error('Error writing to file:', err);
          return;
        }

        console.log('Content has been written to the file successfully:', filePath);
      });
    });
  });
}

function writeMethodologyContentFiles(data) {
  const entriesByMethodology = new Map();

  data.forEach(entry => {
    const m = entry.Methodology;
    if (!entriesByMethodology.has(m)) {
      entriesByMethodology.set(m, []);
    }
    entriesByMethodology.get(m).push(entry);
  });

  entriesByMethodology.forEach((entries, methodology) => {
    const node = entries[0]

    const fn = `src/${urlForMethodology(node)}.md`;
    const folderPath = path.dirname(fn);
    const fileName = path.basename(fn);

    var entryLinks = []
    entries.forEach(entry => {
      entryLinks.push(`* [${entry.Name}](${urlForEntry(entry)})`)
    });
    entryLinks.sort((a, b) => {
      return a.localeCompare(b);
    });

    const fileContent = `---
title: Agile Landscape - Methodology - ${node.Methodology}
header: Agile Landscape - Methodology
layout: "layouts/page.njk"
containerClass: content-margin-top
description: This page is part of my <a href="/agile-landscape">Agile Landscape</a> project.
---

# Methodology: ${node.Methodology}

${node.Methodology} has the following entries: 

${entryLinks.join('\n')}
`

    fs.mkdir(folderPath, { recursive: true }, (err) => {
      if (err) {
        console.error('Error creating folder:', err);
        return;
      }

      const filePath = path.join(folderPath, fileName);

      fs.writeFile(filePath, fileContent, (err) => {
        if (err) {
          console.error('Error writing to file:', err);
          return;
        }

        console.log('Content has been written to the file successfully:', filePath);
      });
    });
  });
}

writeDotFile(agile_landscape_data);
writeEntryContentFiles(agile_landscape_data);
writeMethodologyContentFiles(agile_landscape_data);