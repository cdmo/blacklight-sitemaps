# Blacklight::Sitemaps
[![Gem Version](https://badge.fury.io/rb/blacklight-sitemaps.png)](http://badge.fury.io/rb/blacklight-sitemaps)

Dynamic sitemap generator for Blacklight apps.

## Installation
Add this line to your Blacklight application's Gemfile:

```ruby
gem 'blacklight-sitemaps'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install blacklight-sitemaps
```

Then run the install generator
```bash
$ rails g blacklight:sitemaps:install
```

## solrconfig.xml
In order to run the blacklight-sitemaps, the solrconfig.xml needs to be modified with an
update processor that adds an additional field to each Solr document. If you Blacklight app
stores the solrconfig.xml at the path `solr/conf/solrconfig.xml` the install generator will
load the demo Blacklight solrconfig.xml with the necessary changes. Otherwise you will need
to add the following to your version of the solrconfig.xml:
```
<updateProcessor class="solr.processor.SignatureUpdateProcessorFactory" name="add_hash_id">
  <bool name="enabled">true</bool>
  <str name="signatureField">hashed_id_si</str>
  <bool name="overwriteDupes">false</bool>
  <str name="fields">id</str>
  <str name="signatureClass">solr.processor.Lookup3Signature</str>
</updateProcessor>

<updateRequestProcessorChain name="cloud" processor="add_hash_id" default="true">
  <processor class="solr.LogUpdateProcessorFactory"/>
  <processor class="solr.DistributedUpdateProcessorFactory"/>
  <processor class="solr.RunUpdateProcessorFactory"/>
</updateRequestProcessorChain>
```
Note that the `hashed_id_si` field is a single-valued indexed string field, not stored.

## License
Apache 2.0
