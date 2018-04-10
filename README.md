# TaoBaoBao 

TaoBaoBao is a web app enable users to upload wanted products' pictures and get exactly the same or similar products search results on TaoBao, initiate group buying posts as a host buyer or participate other hosts' posts, and get notified with posts status changing. 

## User Stories

See [user_stories.md](/user_stories.md)

## Motivation

TaoBaoBao is a co-working project dedicated to help users get easier and more joyful products searching experience. This project is proposed by TransferHelper, developed by GemHunter. 

## Screenshots

![Index]()
![Search]()
![Login]()
![Post]()

## Tech/framework used

**Built with**

* [Ruby on Rails](http://rubyonrails.org/) - The back-end framework used
* [Bootstrap](https://getbootstrap.com/) - The front-end framework used

## Features

Cross-platform  
Facebook login

## Installation

To clone and run this application, you'll need [Git](https://git-scm.com/) and [Ruby on Rails](http://rubyonrails.org/) installed on your computer. From your command line:


### Clone this repository
```
$ git clone https://github.com/yameday/taobaobao
```
### Go into the repository
```
$ cd taobaobao
```
### Install dependencies
```
$ bundle install
```
### Run Migration
```
$ rails db:migrate
```
### Generate Fake Users
```
$ rails dev:fetch_user
```
### Generate Fake Post & Participate
```
$ rails dev:fetch_participate
```
### Generate Fake Reply
```
$ rails dev:fetch_reply
```
### Run the app
```
$ rails server
```

Note: If you have difficulty installing Rails environment, follow [this guide](http://installrails.com/).

## Contribute

You may contribute in several ways like creating new features, fixing bugs, improving documentation and examples or translating any document here to your language. 

## Credits

Project Proposer - [TransferHelper](https://www.transferhelper.com.tw/), Taiwan's promising FinTech startup company focusing on transfer solution.

Project Development - [GemHunter](), members: Bob Lai ( Tech Lead ), Kay Cheng, and Francis Huang

Demo Day Campaign Host - [AlphaCamp](https://tw.alphacamp.co/), Asia's top tech & startup school.

## License

MIT License. Copyright © 2018 GemHunter

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
