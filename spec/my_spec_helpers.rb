module SpecHelpers

  def stub_afternoon_message
      stub_weather
      stub_printer("CENTREBIG","Good Afternoon")
      stub_printer("CENTREBIG","~")
      stub_printer("TEXT","Partly cloudy for the hour.")
      stub_printer("TEXT","")
  end

  def expect_afternoon_message_to_have_been_made
      expect(a_http_request("CENTREBIG","Good Afternoon")).to have_been_made
      expect(a_http_request("CENTREBIG","~")).to have_been_made
      expect(a_http_request("TEXT","Partly cloudy for the hour.")).to have_been_made
  end


  def stub_printer(format,text)
    stub_request(:post, "#{ENV['SPARK_API_URI']}/print").
        with(:body => { access_token: ENV['SPARK_TOKEN'], args: "#{format}=#{text}/" }).to_return(:body => "{\n  \"id\": \"#{ENV['SPARK_ID']}\",\n  \"name\": \"core1\",\n  \"last_app\": null,\n  \"connected\": true,\n  \"return_value\": 1\n}")
  end

  def stub_offline_printer(format,text)
    stub_request(:post, "#{ENV['SPARK_API_URI']}/print").
        with(:body => { access_token: ENV['SPARK_TOKEN'], args: "#{format}=#{text}/" }).to_return(:body => "{\n  \"ok\": false,\n  \"error\": \"Timed out.\"\n}")
  end

  def stub_weather
    stub_request(:get, "https://api.forecast.io/forecast/967ecda5e55eea73c15e3a4ce315e508/51.5231,-0.0871")
      .to_return(body: FORECAST_IO_JSON_RESPONE, status: 200)
  end

  def a_http_request(format, text)
    a_request(:post, "#{ENV['SPARK_API_URI']}/print").with(:body => { access_token: ENV['SPARK_TOKEN'], args: "#{format}=#{text}/" })
  end

  def stub_print_for_controller(format,text)
    stub_request(:post, "#{ENV['SPARK_API_URI']}/print").
                 with(:body => {"access_token"=>"e91e5a05963c1bf996298213f0b892a8e33741e1", "args"=>"CENTREBIG=Good Afternoon/"},
                  :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'Host'=>'api.spark.io', 'User-Agent'=>'Ruby'}).
              to_return(:status => 200, :body => "", :headers => {})
  end

	FORECAST_IO_JSON_RESPONE =  '{"latitude":51.5231,"longitude":-0.0871,"timezone":"Europe/London","offset":1,"currently":{"time":1413379319,"summary":"Partly Cloudy","icon":"partly-cloudy-day","nearestStormDistance":13,"nearestStormBearing":42,"precipIntensity":0,"precipProbability":0,"temperature":57.68,"apparentTemperature":57.68,"dewPoint":53.34,"humidity":0.85,"windSpeed":6.63,"windBearing":146,"visibility":4.35,"cloudCover":0.55,"pressure":1003.68,"ozone":273.67},"minutely":{"summary":"Partly cloudy for the hour.","icon":"partly-cloudy-day","data":[{"time":1413379260,"precipIntensity":0,"precipProbability":0},{"time":1413379320,"precipIntensity":0,"precipProbability":0},{"time":1413379380,"precipIntensity":0,"precipProbability":0},{"time":1413379440,"precipIntensity":0,"precipProbability":0},{"time":1413379500,"precipIntensity":0,"precipProbability":0},{"time":1413379560,"precipIntensity":0,"precipProbability":0},{"time":1413379620,"precipIntensity":0,"precipProbability":0},{"time":1413379680,"precipIntensity":0,"precipProbability":0},{"time":1413379740,"precipIntensity":0,"precipProbability":0},{"time":1413379800,"precipIntensity":0,"precipProbability":0},{"time":1413379860,"precipIntensity":0,"precipProbability":0},{"time":1413379920,"precipIntensity":0,"precipProbability":0},{"time":1413379980,"precipIntensity":0,"precipProbability":0},{"time":1413380040,"precipIntensity":0,"precipProbability":0},{"time":1413380100,"precipIntensity":0,"precipProbability":0},{"time":1413380160,"precipIntensity":0,"precipProbability":0},{"time":1413380220,"precipIntensity":0,"precipProbability":0},{"time":1413380280,"precipIntensity":0,"precipProbability":0},{"time":1413380340,"precipIntensity":0,"precipProbability":0},{"time":1413380400,"precipIntensity":0,"precipProbability":0},{"time":1413380460,"precipIntensity":0,"precipProbability":0},{"time":1413380520,"precipIntensity":0,"precipProbability":0},{"time":1413380580,"precipIntensity":0,"precipProbability":0},{"time":1413380640,"precipIntensity":0,"precipProbability":0},{"time":1413380700,"precipIntensity":0,"precipProbability":0},{"time":1413380760,"precipIntensity":0,"precipProbability":0},{"time":1413380820,"precipIntensity":0,"precipProbability":0},{"time":1413380880,"precipIntensity":0,"precipProbability":0},{"time":1413380940,"precipIntensity":0,"precipProbability":0},{"time":1413381000,"precipIntensity":0,"precipProbability":0},{"time":1413381060,"precipIntensity":0,"precipProbability":0},{"time":1413381120,"precipIntensity":0,"precipProbability":0},{"time":1413381180,"precipIntensity":0,"precipProbability":0},{"time":1413381240,"precipIntensity":0,"precipProbability":0},{"time":1413381300,"precipIntensity":0,"precipProbability":0},{"time":1413381360,"precipIntensity":0,"precipProbability":0},{"time":1413381420,"precipIntensity":0,"precipProbability":0},{"time":1413381480,"precipIntensity":0,"precipProbability":0},{"time":1413381540,"precipIntensity":0,"precipProbability":0},{"time":1413381600,"precipIntensity":0,"precipProbability":0},{"time":1413381660,"precipIntensity":0,"precipProbability":0},{"time":1413381720,"precipIntensity":0,"precipProbability":0},{"time":1413381780,"precipIntensity":0,"precipProbability":0},{"time":1413381840,"precipIntensity":0,"precipProbability":0},{"time":1413381900,"precipIntensity":0,"precipProbability":0},{"time":1413381960,"precipIntensity":0,"precipProbability":0},{"time":1413382020,"precipIntensity":0,"precipProbability":0},{"time":1413382080,"precipIntensity":0,"precipProbability":0},{"time":1413382140,"precipIntensity":0,"precipProbability":0},{"time":1413382200,"precipIntensity":0,"precipProbability":0},{"time":1413382260,"precipIntensity":0,"precipProbability":0},{"time":1413382320,"precipIntensity":0,"precipProbability":0},{"time":1413382380,"precipIntensity":0,"precipProbability":0},{"time":1413382440,"precipIntensity":0,"precipProbability":0},{"time":1413382500,"precipIntensity":0,"precipProbability":0},{"time":1413382560,"precipIntensity":0,"precipProbability":0},{"time":1413382620,"precipIntensity":0,"precipProbability":0},{"time":1413382680,"precipIntensity":0,"precipProbability":0},{"time":1413382740,"precipIntensity":0,"precipProbability":0},{"time":1413382800,"precipIntensity":0,"precipProbability":0},{"time":1413382860,"precipIntensity":0,"precipProbability":0}]},"hourly":{"summary":"Light rain starting later this afternoon, continuing until tomorrow morning.","icon":"rain","data":[{"time":1413378000,"summary":"Drizzle","icon":"rain","precipIntensity":0.0056,"precipProbability":0.17,"precipType":"rain","temperature":57.57,"apparentTemperature":57.57,"dewPoint":53.71,"humidity":0.87,"windSpeed":6.19,"windBearing":156,"visibility":4.35,"cloudCover":0.59,"pressure":1003.94,"ozone":273.44},{"time":1413381600,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0044,"precipProbability":0.25,"precipType":"rain","temperature":57.86,"apparentTemperature":57.86,"dewPoint":52.67,"humidity":0.83,"windSpeed":7.76,"windBearing":133,"visibility":4.35,"cloudCover":0.48,"pressure":1003.23,"ozone":274.06},{"time":1413385200,"summary":"Light Rain","icon":"rain","precipIntensity":0.0164,"precipProbability":0.82,"precipType":"rain","temperature":57.71,"apparentTemperature":57.71,"dewPoint":51.94,"humidity":0.81,"windSpeed":8.16,"windBearing":138,"visibility":4.35,"cloudCover":0.68,"pressure":1002.52,"ozone":275.15},{"time":1413388800,"summary":"Light Rain","icon":"rain","precipIntensity":0.0187,"precipProbability":0.86,"precipType":"rain","temperature":57.48,"apparentTemperature":57.48,"dewPoint":52.78,"humidity":0.84,"windSpeed":7.95,"windBearing":137,"visibility":4.35,"cloudCover":0.69,"pressure":1001.84,"ozone":277.02},{"time":1413392400,"summary":"Light Rain","icon":"rain","precipIntensity":0.0196,"precipProbability":0.89,"precipType":"rain","temperature":57.22,"apparentTemperature":57.22,"dewPoint":53.71,"humidity":0.88,"windSpeed":7.63,"windBearing":136,"visibility":4.35,"cloudCover":0.69,"pressure":1001.28,"ozone":279.37},{"time":1413396000,"summary":"Light Rain","icon":"rain","precipIntensity":0.0197,"precipProbability":0.93,"precipType":"rain","temperature":57.15,"apparentTemperature":57.15,"dewPoint":54.78,"humidity":0.92,"windSpeed":7.3,"windBearing":137,"visibility":4.35,"cloudCover":0.91,"pressure":1000.82,"ozone":281.28},{"time":1413399600,"summary":"Light Rain","icon":"rain","precipIntensity":0.0186,"precipProbability":0.93,"precipType":"rain","temperature":57.5,"apparentTemperature":57.5,"dewPoint":55.2,"humidity":0.92,"windSpeed":8.01,"windBearing":138,"visibility":4.35,"cloudCover":0.97,"pressure":1000.48,"ozone":282.34},{"time":1413403200,"summary":"Light Rain","icon":"rain","precipIntensity":0.0167,"precipProbability":0.93,"precipType":"rain","temperature":58.13,"apparentTemperature":58.13,"dewPoint":55.81,"humidity":0.92,"windSpeed":8.61,"windBearing":140,"visibility":4.35,"cloudCover":0.97,"pressure":1000.23,"ozone":282.97},{"time":1413406800,"summary":"Light Rain","icon":"rain","precipIntensity":0.0147,"precipProbability":0.92,"precipType":"rain","temperature":58.48,"apparentTemperature":58.48,"dewPoint":56.18,"humidity":0.92,"windSpeed":8.95,"windBearing":141,"visibility":4.35,"cloudCover":0.97,"pressure":1000.01,"ozone":283.51},{"time":1413410400,"summary":"Light Rain","icon":"rain","precipIntensity":0.0129,"precipProbability":0.76,"precipType":"rain","temperature":58.36,"apparentTemperature":58.36,"dewPoint":56.01,"humidity":0.92,"windSpeed":6.86,"windBearing":160,"visibility":6.01,"cloudCover":0.6,"pressure":999.8,"ozone":284.22},{"time":1413414000,"summary":"Light Rain","icon":"rain","precipIntensity":0.0113,"precipProbability":0.58,"precipType":"rain","temperature":57.97,"apparentTemperature":57.97,"dewPoint":55.61,"humidity":0.92,"windSpeed":6.04,"windBearing":192,"visibility":7.66,"cloudCover":0.59,"pressure":999.59,"ozone":284.84},{"time":1413417600,"summary":"Light Rain","icon":"rain","precipIntensity":0.0098,"precipProbability":0.42,"precipType":"rain","temperature":57.49,"apparentTemperature":57.49,"dewPoint":55.1,"humidity":0.92,"windSpeed":6.95,"windBearing":219,"visibility":9.32,"cloudCover":0.59,"pressure":999.41,"ozone":285.02},{"time":1413421200,"summary":"Drizzle","icon":"rain","precipIntensity":0.0084,"precipProbability":0.35,"precipType":"rain","temperature":56.94,"apparentTemperature":56.94,"dewPoint":54.84,"humidity":0.93,"windSpeed":6.3,"windBearing":217,"visibility":7.66,"cloudCover":0.62,"pressure":999.24,"ozone":284.3},{"time":1413424800,"summary":"Drizzle","icon":"rain","precipIntensity":0.0069,"precipProbability":0.26,"precipType":"rain","temperature":56.27,"apparentTemperature":56.27,"dewPoint":54.45,"humidity":0.94,"windSpeed":5.59,"windBearing":215,"visibility":6.01,"cloudCover":0.65,"pressure":999.11,"ozone":283.15},{"time":1413428400,"summary":"Drizzle","icon":"rain","precipIntensity":0.0058,"precipProbability":0.19,"precipType":"rain","temperature":55.63,"apparentTemperature":55.63,"dewPoint":54.07,"humidity":0.94,"windSpeed":4.88,"windBearing":211,"visibility":4.35,"cloudCover":0.69,"pressure":999.07,"ozone":282.54},{"time":1413432000,"summary":"Drizzle","icon":"rain","precipIntensity":0.0051,"precipProbability":0.15,"precipType":"rain","temperature":54.9,"apparentTemperature":54.9,"dewPoint":53.07,"humidity":0.94,"windSpeed":5.42,"windBearing":209,"visibility":4.35,"cloudCover":0.69,"pressure":999.2,"ozone":282.95},{"time":1413435600,"summary":"Mostly Cloudy","icon":"partly-cloudy-night","precipIntensity":0.0048,"precipProbability":0.12,"precipType":"rain","temperature":54.26,"apparentTemperature":54.26,"dewPoint":52.15,"humidity":0.93,"windSpeed":5.96,"windBearing":204,"visibility":4.35,"cloudCover":0.7,"pressure":999.45,"ozone":283.91},{"time":1413439200,"summary":"Mostly Cloudy","icon":"partly-cloudy-night","precipIntensity":0.0044,"precipProbability":0.09,"precipType":"rain","temperature":54.28,"apparentTemperature":54.28,"dewPoint":51.84,"humidity":0.91,"windSpeed":6.71,"windBearing":203,"visibility":4.35,"cloudCover":0.69,"pressure":999.74,"ozone":284.98},{"time":1413442800,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0038,"precipProbability":0.06,"precipType":"rain","temperature":55.38,"apparentTemperature":55.38,"dewPoint":52.65,"humidity":0.91,"windSpeed":7.35,"windBearing":212,"visibility":5.29,"cloudCover":0.56,"pressure":1000.08,"ozone":286.37},{"time":1413446400,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.003,"precipProbability":0.03,"precipType":"rain","temperature":57.18,"apparentTemperature":57.18,"dewPoint":54.07,"humidity":0.89,"windSpeed":8.15,"windBearing":219,"visibility":6.22,"cloudCover":0.41,"pressure":1000.48,"ozone":287.86},{"time":1413450000,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0024,"precipProbability":0.01,"precipType":"rain","temperature":59.04,"apparentTemperature":59.04,"dewPoint":55.52,"humidity":0.88,"windSpeed":9.01,"windBearing":225,"visibility":7.16,"cloudCover":0.28,"pressure":1000.87,"ozone":288.37},{"time":1413453600,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.002,"precipProbability":0.01,"precipType":"rain","temperature":60.83,"apparentTemperature":60.83,"dewPoint":55.97,"humidity":0.84,"windSpeed":9.17,"windBearing":225,"visibility":7.88,"cloudCover":0.28,"pressure":1001.22,"ozone":287.09},{"time":1413457200,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0018,"precipProbability":0.01,"precipType":"rain","temperature":62.51,"apparentTemperature":62.51,"dewPoint":56.23,"humidity":0.8,"windSpeed":9.33,"windBearing":224,"visibility":8.6,"cloudCover":0.29,"pressure":1001.49,"ozone":284.84},{"time":1413460800,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0017,"precipProbability":0.01,"precipType":"rain","temperature":63.61,"apparentTemperature":63.61,"dewPoint":55.98,"humidity":0.76,"windSpeed":9.52,"windBearing":222,"visibility":9.32,"cloudCover":0.31,"pressure":1001.59,"ozone":282.93},{"time":1413464400,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0017,"precipProbability":0.01,"precipType":"rain","temperature":63.94,"apparentTemperature":63.94,"dewPoint":55.87,"humidity":0.75,"windSpeed":9.68,"windBearing":221,"visibility":9.32,"cloudCover":0.44,"pressure":1001.48,"ozone":281.82},{"time":1413468000,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0016,"precipProbability":0.01,"precipType":"rain","temperature":63.72,"apparentTemperature":63.72,"dewPoint":55.37,"humidity":0.74,"windSpeed":9.69,"windBearing":219,"visibility":9.32,"cloudCover":0.59,"pressure":1001.21,"ozone":281.05},{"time":1413471600,"summary":"Mostly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0017,"precipProbability":0.02,"precipType":"rain","temperature":63.04,"apparentTemperature":63.04,"dewPoint":54.56,"humidity":0.74,"windSpeed":9.47,"windBearing":216,"visibility":9.32,"cloudCover":0.72,"pressure":1000.93,"ozone":280.65},{"time":1413475200,"summary":"Mostly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0019,"precipProbability":0.02,"precipType":"rain","temperature":61.72,"apparentTemperature":61.72,"dewPoint":54.54,"humidity":0.77,"windSpeed":8.94,"windBearing":207,"visibility":9.32,"cloudCover":0.73,"pressure":1000.72,"ozone":280.73},{"time":1413478800,"summary":"Mostly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0024,"precipProbability":0.03,"precipType":"rain","temperature":60.07,"apparentTemperature":60.07,"dewPoint":54.23,"humidity":0.81,"windSpeed":8.33,"windBearing":200,"visibility":9.32,"cloudCover":0.73,"pressure":1000.61,"ozone":281.17},{"time":1413482400,"summary":"Mostly Cloudy","icon":"partly-cloudy-night","precipIntensity":0.0038,"precipProbability":0.07,"precipType":"rain","temperature":58.91,"apparentTemperature":58.91,"dewPoint":54.18,"humidity":0.84,"windSpeed":8.35,"windBearing":193,"visibility":9.32,"cloudCover":0.72,"pressure":1000.5,"ozone":281.63},{"time":1413486000,"summary":"Drizzle","icon":"rain","precipIntensity":0.0068,"precipProbability":0.21,"precipType":"rain","temperature":58.59,"apparentTemperature":58.59,"dewPoint":54.47,"humidity":0.86,"windSpeed":7.89,"windBearing":187,"visibility":9.32,"cloudCover":0.72,"pressure":1000.28,"ozone":281.81},{"time":1413489600,"summary":"Light Rain","icon":"rain","precipIntensity":0.0112,"precipProbability":0.43,"precipType":"rain","temperature":58.7,"apparentTemperature":58.7,"dewPoint":55.05,"humidity":0.88,"windSpeed":7.62,"windBearing":181,"visibility":9.32,"cloudCover":0.72,"pressure":1000.01,"ozone":282.01},{"time":1413493200,"summary":"Light Rain","icon":"rain","precipIntensity":0.0162,"precipProbability":0.55,"precipType":"rain","temperature":58.85,"apparentTemperature":58.85,"dewPoint":55.66,"humidity":0.89,"windSpeed":7.41,"windBearing":176,"visibility":9.32,"cloudCover":0.72,"pressure":999.86,"ozone":282.87},{"time":1413496800,"summary":"Light Rain","icon":"rain","precipIntensity":0.0219,"precipProbability":0.56,"precipType":"rain","temperature":58.94,"apparentTemperature":58.94,"dewPoint":55.87,"humidity":0.9,"windSpeed":7.23,"windBearing":182,"visibility":7.75,"cloudCover":0.73,"pressure":999.85,"ozone":284.8},{"time":1413500400,"summary":"Light Rain","icon":"rain","precipIntensity":0.0272,"precipProbability":0.57,"precipType":"rain","temperature":59.07,"apparentTemperature":59.07,"dewPoint":56.09,"humidity":0.9,"windSpeed":7.13,"windBearing":189,"visibility":6.19,"cloudCover":0.73,"pressure":999.95,"ozone":287.38},{"time":1413504000,"summary":"Light Rain","icon":"rain","precipIntensity":0.0301,"precipProbability":0.56,"precipType":"rain","temperature":59.07,"apparentTemperature":59.07,"dewPoint":56.18,"humidity":0.9,"windSpeed":7.24,"windBearing":197,"visibility":4.62,"cloudCover":0.72,"pressure":1000.12,"ozone":290},{"time":1413507600,"summary":"Light Rain","icon":"rain","precipIntensity":0.0298,"precipProbability":0.49,"precipType":"rain","temperature":58.86,"apparentTemperature":58.86,"dewPoint":56.01,"humidity":0.9,"windSpeed":7.77,"windBearing":200,"visibility":6.19,"cloudCover":0.7,"pressure":1000.33,"ozone":292.79},{"time":1413511200,"summary":"Light Rain","icon":"rain","precipIntensity":0.0272,"precipProbability":0.42,"precipType":"rain","temperature":58.52,"apparentTemperature":58.52,"dewPoint":55.71,"humidity":0.9,"windSpeed":8.17,"windBearing":203,"visibility":7.75,"cloudCover":0.68,"pressure":1000.6,"ozone":295.61},{"time":1413514800,"summary":"Light Rain","icon":"rain","precipIntensity":0.0234,"precipProbability":0.35,"precipType":"rain","temperature":58.15,"apparentTemperature":58.15,"dewPoint":55.37,"humidity":0.9,"windSpeed":8.46,"windBearing":205,"visibility":9.32,"cloudCover":0.66,"pressure":1000.97,"ozone":297.54},{"time":1413518400,"summary":"Light Rain","icon":"rain","precipIntensity":0.019,"precipProbability":0.34,"precipType":"rain","temperature":57.58,"apparentTemperature":57.58,"dewPoint":54.96,"humidity":0.91,"windSpeed":8.47,"windBearing":206,"visibility":9.32,"cloudCover":0.61,"pressure":1001.47,"ozone":298.2},{"time":1413522000,"summary":"Light Rain","icon":"rain","precipIntensity":0.0145,"precipProbability":0.33,"precipType":"rain","temperature":56.99,"apparentTemperature":56.99,"dewPoint":54.52,"humidity":0.91,"windSpeed":8.57,"windBearing":207,"visibility":9.32,"cloudCover":0.57,"pressure":1002.1,"ozone":297.97},{"time":1413525600,"summary":"Light Rain","icon":"rain","precipIntensity":0.0107,"precipProbability":0.3,"precipType":"rain","temperature":56.98,"apparentTemperature":56.98,"dewPoint":54.59,"humidity":0.92,"windSpeed":8.73,"windBearing":207,"visibility":9.32,"cloudCover":0.53,"pressure":1002.77,"ozone":297.02},{"time":1413529200,"summary":"Drizzle","icon":"rain","precipIntensity":0.0076,"precipProbability":0.24,"precipType":"rain","temperature":57.98,"apparentTemperature":57.98,"dewPoint":55.41,"humidity":0.91,"windSpeed":8.9,"windBearing":208,"visibility":9.32,"cloudCover":0.5,"pressure":1003.53,"ozone":295.02},{"time":1413532800,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0046,"precipProbability":0.12,"precipType":"rain","temperature":59.59,"apparentTemperature":59.59,"dewPoint":56.76,"humidity":0.9,"windSpeed":9.14,"windBearing":210,"visibility":9.32,"cloudCover":0.48,"pressure":1004.38,"ozone":292.31},{"time":1413536400,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0024,"precipProbability":0.06,"precipType":"rain","temperature":61.17,"apparentTemperature":61.17,"dewPoint":58.04,"humidity":0.89,"windSpeed":9.43,"windBearing":211,"visibility":9.32,"cloudCover":0.46,"pressure":1005.27,"ozone":290.07},{"time":1413540000,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0.0012,"precipProbability":0.01,"precipType":"rain","temperature":62.56,"apparentTemperature":62.56,"dewPoint":58.64,"humidity":0.87,"windSpeed":10.11,"windBearing":210,"visibility":9.32,"cloudCover":0.52,"pressure":1006.13,"ozone":289.11},{"time":1413543600,"summary":"Partly Cloudy","icon":"partly-cloudy-day","precipIntensity":0,"precipProbability":0,"temperature":63.82,"apparentTemperature":63.82,"dewPoint":59.06,"humidity":0.85,"windSpeed":10.73,"windBearing":208,"visibility":9.32,"cloudCover":0.58,"pressure":1006.8,"ozone":288.64},{"time":1413547200,"summary":"Mostly Cloudy","icon":"partly-cloudy-day","precipIntensity":0,"precipProbability":0,"temperature":64.61,"apparentTemperature":64.61,"dewPoint":59.15,"humidity":0.82,"windSpeed":11.29,"windBearing":206,"visibility":9.32,"cloudCover":0.64,"pressure":1007.26,"ozone":287.44},{"time":1413550800,"summary":"Mostly Cloudy","icon":"partly-cloudy-day","precipIntensity":0,"precipProbability":0,"temperature":64.81,"apparentTemperature":64.81,"dewPoint":59.23,"humidity":0.82,"windSpeed":11.25,"windBearing":201,"visibility":9.32,"cloudCover":0.65,"pressure":1007.48,"ozone":284.7}]},"daily":{"summary":"Light rain today through Monday, with temperatures rising to 69°F on Saturday.","icon":"rain","data":[{"time":1413327600,"summary":"Light rain starting in the afternoon.","icon":"rain","sunriseTime":1413354309,"sunsetTime":1413392965,"moonPhase":0.74,"precipIntensity":0.0069,"precipIntensityMax":0.0197,"precipIntensityMaxTime":1413396000,"precipProbability":0.93,"precipType":"rain","temperatureMin":52.68,"temperatureMinTime":1413352800,"temperatureMax":58.48,"temperatureMaxTime":1413406800,"apparentTemperatureMin":52.68,"apparentTemperatureMinTime":1413352800,"apparentTemperatureMax":58.48,"apparentTemperatureMaxTime":1413406800,"dewPoint":53.14,"humidity":0.91,"windSpeed":4.42,"windBearing":133,"visibility":4.4,"cloudCover":0.79,"pressure":1004.35,"ozone":278.89},{"time":1413414000,"summary":"Light rain in the morning and evening.","icon":"rain","sunriseTime":1413440811,"sunsetTime":1413479237,"moonPhase":0.77,"precipIntensity":0.0059,"precipIntensityMax":0.0219,"precipIntensityMaxTime":1413496800,"precipProbability":0.58,"precipType":"rain","temperatureMin":54.26,"temperatureMinTime":1413435600,"temperatureMax":63.94,"temperatureMaxTime":1413464400,"apparentTemperatureMin":54.26,"apparentTemperatureMinTime":1413435600,"apparentTemperatureMax":63.94,"apparentTemperatureMaxTime":1413464400,"dewPoint":54.64,"humidity":0.86,"windSpeed":7.45,"windBearing":208,"visibility":7.67,"cloudCover":0.59,"pressure":1000.25,"ozone":283.65},{"time":1413500400,"summary":"Light rain in the morning.","icon":"rain","sunriseTime":1413527313,"sunsetTime":1413565509,"moonPhase":0.8,"precipIntensity":0.0091,"precipIntensityMax":0.0301,"precipIntensityMaxTime":1413504000,"precipProbability":0.57,"precipType":"rain","temperatureMin":56.98,"temperatureMinTime":1413525600,"temperatureMax":64.81,"temperatureMaxTime":1413550800,"apparentTemperatureMin":56.98,"apparentTemperatureMinTime":1413525600,"apparentTemperatureMax":64.81,"apparentTemperatureMaxTime":1413550800,"dewPoint":57.12,"humidity":0.88,"windSpeed":9.32,"windBearing":191,"visibility":8.8,"cloudCover":0.64,"pressure":1004.84,"ozone":285.67},{"time":1413586800,"summary":"Mostly cloudy throughout the day.","icon":"partly-cloudy-day","sunriseTime":1413613816,"sunsetTime":1413651783,"moonPhase":0.83,"precipIntensity":0.0038,"precipIntensityMax":0.0045,"precipIntensityMaxTime":1413633600,"precipProbability":0.17,"precipType":"rain","temperatureMin":63.18,"temperatureMinTime":1413586800,"temperatureMax":69.2,"temperatureMaxTime":1413633600,"apparentTemperatureMin":63.18,"apparentTemperatureMinTime":1413586800,"apparentTemperatureMax":69.2,"apparentTemperatureMaxTime":1413633600,"dewPoint":61.73,"humidity":0.87,"windSpeed":13.58,"windBearing":193,"visibility":9.32,"cloudCover":0.72,"pressure":1006.92,"ozone":264.28},{"time":1413673200,"summary":"Drizzle overnight.","icon":"rain","sunriseTime":1413700320,"sunsetTime":1413738057,"moonPhase":0.86,"precipIntensity":0.0034,"precipIntensityMax":0.0056,"precipIntensityMaxTime":1413756000,"precipProbability":0.25,"precipType":"rain","temperatureMin":62.04,"temperatureMinTime":1413698400,"temperatureMax":68.6,"temperatureMaxTime":1413720000,"apparentTemperatureMin":62.04,"apparentTemperatureMinTime":1413698400,"apparentTemperatureMax":68.6,"apparentTemperatureMaxTime":1413720000,"dewPoint":60.79,"humidity":0.87,"windSpeed":11.51,"windBearing":206,"visibility":9.32,"cloudCover":0.62,"pressure":1010.24,"ozone":256.69},{"time":1413759600,"summary":"Mostly cloudy throughout the day.","icon":"partly-cloudy-day","sunriseTime":1413786823,"sunsetTime":1413824332,"moonPhase":0.89,"precipIntensity":0.0032,"precipIntensityMax":0.006,"precipIntensityMaxTime":1413763200,"precipProbability":0.21,"precipType":"rain","temperatureMin":59.55,"temperatureMinTime":1413784800,"temperatureMax":65.48,"temperatureMaxTime":1413813600,"apparentTemperatureMin":59.55,"apparentTemperatureMinTime":1413784800,"apparentTemperatureMax":65.48,"apparentTemperatureMaxTime":1413813600,"dewPoint":58.75,"humidity":0.89,"windSpeed":10.64,"windBearing":225,"visibility":9.32,"cloudCover":0.81,"pressure":1012.74,"ozone":263.53},{"time":1413846000,"summary":"Mostly cloudy until evening.","icon":"partly-cloudy-day","sunriseTime":1413873327,"sunsetTime":1413910609,"moonPhase":0.92,"precipIntensity":0.0027,"precipIntensityMax":0.0049,"precipIntensityMaxTime":1413889200,"precipProbability":0.18,"precipType":"rain","temperatureMin":56.32,"temperatureMinTime":1413928800,"temperatureMax":63.57,"temperatureMaxTime":1413896400,"apparentTemperatureMin":56.32,"apparentTemperatureMinTime":1413928800,"apparentTemperatureMax":63.57,"apparentTemperatureMaxTime":1413896400,"dewPoint":56.72,"humidity":0.9,"windSpeed":8.33,"windBearing":236,"cloudCover":0.75,"pressure":1012.79,"ozone":266.29},{"time":1413932400,"summary":"Mostly cloudy throughout the day.","icon":"partly-cloudy-day","sunriseTime":1413959832,"sunsetTime":1413996886,"moonPhase":0.95,"precipIntensity":0.0009,"precipIntensityMax":0.0013,"precipIntensityMaxTime":1414015200,"precipProbability":0.01,"precipType":"rain","temperatureMin":53.22,"temperatureMinTime":1413957600,"temperatureMax":60.67,"temperatureMaxTime":1413982800,"apparentTemperatureMin":53.22,"apparentTemperatureMinTime":1413957600,"apparentTemperatureMax":60.67,"apparentTemperatureMaxTime":1413982800,"dewPoint":52.99,"humidity":0.89,"windSpeed":8.53,"windBearing":248,"cloudCover":0.59,"pressure":1015.96,"ozone":266.03}]},"flags":{"sources":["metwarn","isd","nearest-precip","madis","fnmoc","cmc","gfs","datapoint","darksky"],"isd-stations":["037683-99999","037780-99999","037790-99999","037820-99999","037830-99999"],"madis-stations":["AR120","AT501","C1115","D4121","D4400","D5621","D6143","D6556","D7856","D8710","E2865","E3734","E4610","EGKB","EGLL","EGWU"],"datapoint-stations":["uk-324386","uk-350150","uk-350734","uk-350928","uk-350929","uk-351713","uk-352036","uk-352196","uk-352409","uk-352932","uk-353241","uk-353331","uk-353605","uk-353669","uk-354160","uk-354379"],"darksky-stations":["uk_london"],"units":"us"}}' 

end 