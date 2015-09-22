MinkPhantomJSExtension
===========================
[![Build Status](https://travis-ci.org/jcalderonzumba/MinkPhantomJSExtension.svg?branch=master)](https://travis-ci.org/jcalderonzumba/MinkPhantomJSExtension)
[![Latest Stable Version](https://poser.pugx.org/jcalderonzumba/behat-phantomjs-extension/v/stable)](https://packagist.org/packages/jcalderonzumba/behat-phantomjs-extension)
[![Total Downloads](https://poser.pugx.org/jcalderonzumba/behat-phantomjs-extension/downloads)](https://packagist.org/packages/jcalderonzumba/behat-phantomjs-extension)

An integration layer between Behat 3.0+ and MinkPhantomJSDriver.

Use [Composer](https://getcomposer.org/) to install all required PHP dependencies:

```bash
$ composer require --dev behat/mink jcalderonzumba/mink-phantomjs-driver jcalderonzumba/behat-phantomjs-extension
```

How to use
-------------
PhantomJSExtension configuration (for the moment NONE).
```yml
default:
  extensions:
    Zumba\PhantomJSExtension:
```
PhantomJSDriver specific configuration:
```yml
Behat\MinkExtension:
phantomjs:
    phantom_server: "http://localhost:8510/api"
    template_cache: "/tmp/pjsdrivercache/phantomjs"
```
PhantomJS browser start:
```bash
phantomjs --ssl-protocol=any --ignore-ssl-errors=true vendor/jcalderonzumba/gastonjs/src/Client/main.js 8510 1024 768 2>&1 >> /tmp/gastonjs.log &
```

Copyright
---------

Copyright (c) 2015 Juan Francisco Calderon Zumba <juanfcz@gmail.com>
