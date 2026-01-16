let mix = require('laravel-mix')

const path = require('path')
let directory = path.basename(path.resolve(__dirname))

const source = 'platform/themes/' + directory
const dist = 'public/themes/' + directory

mix
    .copy(source + '/assets/css/style.css', dist + '/css')
    .copy(source + '/assets/css/job-board.css', dist + '/css')
    .copy(source + '/js/miracle.js', dist + '/js')

if (mix.inProduction()) {
    mix
        .copy(dist + '/css/style.css', source + '/public/css')
        .copy(dist + '/css/job-board.css', source + '/public/css')
        .copy(dist + '/js/miracle.js', source + '/public/js')
}
