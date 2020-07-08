# Simple example Rack app with OpenTelemetry Ruby

To run this:

```sh
bundle
bundle exec rackup app.rb
```

Then curl it:

```sh
curl http://localhost:9292
```

You should see OpenTelemetry spans emitted to the Rack logs, e.g.:

```
#<struct OpenTelemetry::SDK::Trace::SpanData
 name="HTTP GET",
 kind=:client,
 status=
  #<OpenTelemetry::Trace::Status:0x00007f9fd29459c0
   @canonical_code=0,
   @description="">,
 parent_span_id="11a6468befb31de8",
 child_count=0,
 total_recorded_attributes=7,
 total_recorded_events=0,
 total_recorded_links=0,
 start_timestamp=2020-07-08 14:51:44 -0400,
 end_timestamp=2020-07-08 14:51:44 -0400,
 attributes=
  {"component"=>"http",
   "http.method"=>"GET",
   "http.scheme"=>"http",
   "http.target"=>"/",
   "peer.hostname"=>"google.com",
   "peer.port"=>80,
   "http.status_code"=>301},
 links=nil,
 events=nil,
 library_resource=
  #<OpenTelemetry::SDK::Resources::Resource:0x00007f9fd00fdb98
   @labels={"name"=>"OpenTelemetry::Adapters::Net::HTTP", "version"=>"0.4.0"}>,
 span_id="b119408771b19e45",
 trace_id="ca48469f3269d1ed824bbe84c48113b7",
 trace_flags=#<OpenTelemetry::Trace::TraceFlags:0x00007f9fd08b2618 @flags=1>>
#<struct OpenTelemetry::SDK::Trace::SpanData
 name="http://localhost:9292/",
 kind=:server,
 status=
  #<OpenTelemetry::Trace::Status:0x00007f9fd29854d0
   @canonical_code=0,
   @description="">,
 parent_span_id="0000000000000000",
 child_count=0,
 total_recorded_attributes=7,
 total_recorded_events=0,
 total_recorded_links=0,
 start_timestamp=2020-07-08 14:51:44 -0400,
 end_timestamp=2020-07-08 14:51:44 -0400,
 attributes=
  {"component"=>"http",
   "http.method"=>"GET",
   "http.host"=>"localhost:9292",
   "http.scheme"=>"http",
   "http.target"=>"/",
   "http.status_code"=>200,
   "http.status_text"=>"OK"},
 links=nil,
 events=nil,
 library_resource=
  #<OpenTelemetry::SDK::Resources::Resource:0x00007f9fd00f4ea8
   @labels={"name"=>"OpenTelemetry::Adapters::Rack", "version"=>"0.4.0"}>,
 span_id="11a6468befb31de8",
 trace_id="ca48469f3269d1ed824bbe84c48113b7",
 trace_flags=#<OpenTelemetry::Trace::TraceFlags:0x00007f9fd08b2618 @flags=1>>
::1 - - [08/Jul/2020:14:51:44 -0400] "GET / HTTP/1.1" 200 5 0.1121
```
