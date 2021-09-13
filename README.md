# mintbooru

An imageboard that's a little more social.

## Requirements

  - Ruby 2.7.3
  - Node.js 14.x
  - Java 11
  - PostgreSQL 12

## Information about application structure

  - mintbooru runs on the main branch of Rails to get the newest features,
so please keep that in mind. We are unapologetically modern in our backend,
and we don't apologize for it.

  - We use a combination of tools to make this app work. We use the
[YUI Compressor](https://yui.github.io/yuicompressor/) to compress CSS
(mainly because Luna wanted to mess around with it for shits and giggles),
and we use the Terser gem to compress JS.

  - JS is compiled using Webpack, and is included in the Sprockets build process.

  - User authentication is implemented through
[Devise](https://github.com/heartcombo/devise), and is modified as needed.

## Credits

  - [Luna](https://luna.mint.lgbt) - Main developer
  
  - [mint](https://they.mint.lgbt) - Developer

  - [Erin](https://the-system.eu.org) - For being with me in my darkest times

## License

As I want this to be as accessible as possible, mintbooru is licensed under the
[Apache 2.0](COPYING) license. This allows you to do almost anything with the application,
but not use our branding in your app.
