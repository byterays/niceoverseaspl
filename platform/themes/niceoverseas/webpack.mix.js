let mix = require('laravel-mix')

const path = require('path')
let directory = path.basename(path.resolve(__dirname))

const source = 'platform/themes/' + directory
const dist = 'public/themes/' + directory

// mix
//     .copy(source + '/assets/css/custom.css', dist + '/css')   
//     .copy(source + '/js/function.js', dist + '/js')

// if (mix.inProduction()) {
//     mix
//         .copy(dist + '/css/custom.css', source + '/public//css')      
//         .copy(dist + '/js/function.js', source + '/public/js')
// }
