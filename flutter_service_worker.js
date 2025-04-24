'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "5fc2637e1361511a16e99a78957d2be5",
"assets/AssetManifest.bin": "7c03c40b46d6ab2c642af211fe1137d9",
"assets/map.html": "f2b0e8dfe0b5edafd1e3fb68fdbc5669",
"assets/assets/fonts/Francisco.woff": "b76f90bc037f63f9beec03aa2df6fec2",
"assets/assets/fonts/MaruBuri-SemiBold.ttf": "43dffdac3db1bcce6ffc1ffa6d93f5c8",
"assets/assets/fonts/MaruBuri-Regular.ttf": "5a792d9e00f442f4b9222649b704fcf4",
"assets/assets/fonts/MaruBuri-Bold.ttf": "170bd21a62e8e9a0eadccfd9d578ed57",
"assets/assets/fonts/MaruBuri-Light.ttf": "1910f89081df89e38b1dcd822956de92",
"assets/assets/fonts/KNPSKkomi.otf": "dd3cf5bc1a615637bf760008e2dd165e",
"assets/assets/images/gallery_13.jpg": "476bc0336b631c8d085201c832bfb225",
"assets/assets/images/gallery_17.jpg": "eb1728d78a6c87c85d8dfda7de131db2",
"assets/assets/images/home_title.jpg": "dbf761be3977bf2409caf48542133db7",
"assets/assets/images/gallery_4.jpg": "35c8cf4627b9e6a005482c6c0ebb46ca",
"assets/assets/images/gallery_14.jpg": "469e2bd2b03bed283edc6d6133f1669b",
"assets/assets/images/splash_icon.png": "293e8eec0ee04e29d294f45d5c5e01b8",
"assets/assets/images/bouquet.png": "3dcb6f4d3ba80d5ae2a498093756348a",
"assets/assets/images/gallery_6.jpg": "a8071e171e1f3ec84fa005e827b1ffe0",
"assets/assets/images/gallery_15.jpg": "4d4207e8234fba890d47c66ca523b2ac",
"assets/assets/images/gallery_16.jpg": "d258b70daeb3a877d758fd784e04fdaf",
"assets/assets/images/gallery_3.jpg": "587d8524e9100877849f72c2ca672613",
"assets/assets/images/gallery_2.jpg": "248ad61f3deb814df1b6f3dda641e292",
"assets/assets/images/gallery_1.jpg": "28afa8f6c91c297fc0cbced8df38dac3",
"assets/assets/images/gallery_7.jpg": "60698beb60e9db244fc3bae7dd05a2e5",
"assets/assets/images/gallery_9.jpg": "5d007ac0a57e625e545c4298a75132a3",
"assets/assets/images/gallery_8.jpg": "b6882ad9a0e050f427b28c93aa3c7f40",
"assets/assets/images/gallery_12.jpg": "44c5f0799b1961afa54becf9eabde9ee",
"assets/assets/images/gallery_5.jpg": "69ae5323cb02ad7798ed9306ef47c7c6",
"assets/assets/images/gallery_10.jpg": "af1cf57845e8d5b3a497766ac48a5874",
"assets/assets/images/gallery_11.jpg": "17dc319e800f288ae68c554b43f29949",
"assets/FontManifest.json": "bfe78b66d4c00beae900544c8db98187",
"assets/fonts/MaterialIcons-Regular.otf": "d119c66d80f30e8f8e446830dd1d181b",
"assets/AssetManifest.bin.json": "f0c10801cb5051a56f07d8b93ec62225",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "8a3fa8552be1438e1a8a692c4cb2a1db",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"version.json": "2b521e10dfa0f067561de489a19d6620",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"index.html": "ac743aa4d403471598199103966948af",
"/": "ac743aa4d403471598199103966948af",
"flutter_bootstrap.js": "614551d381dea2c56e2aeebffce51b0a",
"icons/Icon-192.png": "a1232325f18e6e913e075952ba3a43df",
"icons/Icon-maskable-192.png": "b49ac3b3853559b126362b778f9ee7de",
"icons/Icon-maskable-512.png": "79de3889e6889b542cda9ae7ce4803d8",
"icons/Icon-512.png": "6208574e0a2bed7848b488455d3c8d82",
"favicon.png": "b8fc932282b9ab5270a2d1149e0ddde0",
"main.dart.js": "1513be7a0ba50d5fa654a6499f4907c1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
