# Guaycuru Web Server
# Static Web Server built on top of Node Simple Router

## Install

From Node Package Manager:

<pre>
  npm install guaycuru
</pre>

or from source:

<pre>
  git clone git://github.com/sandy98/guaycuru.git
</pre>

## Purpose
Serves static content with root at the directory it is run from.

## Dependencies
Node Simple Router

## Basic Usage
```bash
cd mywebdir
guaycuru
```
## That's it
Well, almost. 
As of current version (0.0.5) Guaycuru is able (and will attempt to) run cgi programs located under its cgi directory,
which defaults to cgi-bin. This may be configured through the command line, along the lines of:
guaycuru [port] [cgi directory]
Port defaults to 8000 and cgi directory, as was previously mentioned, defaults to "cgi-bin" 


## Note

The name stands for an indian group that used to live in the sorroundings of my home town - no apaches or cherokees
around here... -

## License

(The MIT License)

Copyright (c) 2012 Ernesto Savoretti <esavoretti@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
