const fs = require('fs')
const fetch = require('node-fetch')
const unionBy = require('lodash/unionBy')
require('dotenv').config()

const domain = "https://stephanhagemann.com"

// Define Cache Location and API Endpoint
const COLD_STORAGE_FILE_PATH = 'packs_userfacing/posts/app/models/posts/cold_storage/webmentions.json'
const CACHE_FILE_PATH = '_cache/webmentions.json'
const API = 'https://webmention.io/api'
const TOKEN = process.env.WEBMENTION_IO_TOKEN

async function fetchWebmentions(since, perPage = 10000) {
  // If we dont have a domain name or token, abort
  if (!domain || !TOKEN) {
    console.warn('>>> unable to fetch webmentions: missing domain or token')
    return false
  }

  let url = `${API}/mentions.jf2?domain=${domain}&token=${TOKEN}&per-page=${perPage}`
  if (since) url += `&since=${since}` // only fetch new mentions

  const response = await fetch(url)
  if (response.ok) {
    const feed = await response.json()
    console.log(`>>> ${feed.children.length} new webmentions fetched from ${API} for ${domain}`)
    return feed
  }

  return null
}

// Merge fresh webmentions with cached entries, unique per id
function mergeWebmentions(a, b) {
  return unionBy(a.children, b.children, 'wm-id')
}

// save combined webmentions in cache file
function writeToCache(data) {
  const dir = '_cache'
  const fileContent = JSON.stringify(data, null, 2)
  // create cache folder if it doesnt exist already
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir)
  }
  // write data to cache json file
  fs.writeFile(CACHE_FILE_PATH, fileContent, err => {
    if (err) throw err
    console.log(`>>> webmentions cached to ${CACHE_FILE_PATH}`)
  })
}

// get cache contents from json file
function readFromCache() {
  var coldStorage = {
    lastFetched: null,
    children: []
  }
  if (fs.existsSync(COLD_STORAGE_FILE_PATH)) {
    const cacheFile = fs.readFileSync(COLD_STORAGE_FILE_PATH)
    coldStorage = JSON.parse(cacheFile)
  }

  var cache = {
    lastFetched: null,
    children: []
  }
  if (fs.existsSync(CACHE_FILE_PATH)) {
    const cacheFile = fs.readFileSync(CACHE_FILE_PATH)
    cache = JSON.parse(cacheFile)
  }
  date = Date.parse(cache.lastFetched) > Date.parse(coldStorage.lastFetched) ? cache.lastFetched : coldStorage.lastFetched
  const webmentions = {
    lastFetched: date,
    children: mergeWebmentions(cache, coldStorage)
  }
  return webmentions;
}

console.log('>>> Reading webmentions from cache...');

const cache = readFromCache()

if (cache.children.length) {
  console.log(`>>> ${cache.children.length} webmentions loaded from cache`)
}

console.log(`>>> Checking for new webmentions... (new once since ${cache.lastFetched})`);
fetchWebmentions(cache.lastFetched).then((feed) => {
  const webmentions = {
    lastFetched: new Date().toISOString(),
    children: mergeWebmentions(cache, feed)
  }

  writeToCache(webmentions)
  return webmentions

})


return cache
