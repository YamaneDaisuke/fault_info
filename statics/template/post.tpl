<!doctype html>
<html lang="ja">
  <head>
    <meta charset="UTF-8"/>
    <title>Information::charakoba.com</title>
    {% include "include.tpl" %}
    <script>
     $(document).ready(function() {
       $('select').material_select();
       $('.datepicker').pickadate({
         selectMonths: true,
         selectYears: 5,
         format: 'yyyy/mm/dd'
       });
       $('textarea#detail').characterCounter();
       $('#submit').click(post_info);
     });
     function post_info() {
       $.post(
         "/api",
         {
           "type": $('#type').val(),
           "service": $('#service').val(),
           "begin": $('#begin-date').val()+' '+$('#begin-hour').val()+':'+$('#begin-minute').val()+':'+$('#begin-second').val(),
           "end": $('#end-date').val()+' '+$('#end-hour').val()+':'+$('#end-minute').val()+':'+$('#end-second').val(),
           "detail": $('#detail').val(),
           "apikey": $('#apikey').val()
         },
         function() {
           $(location).attr('href', '/');
         }
       );
     }
    </script>
  </head>
  <body>
    {% include "navbar.tpl" %}
    <main class="container">
      <div class="row">
        <div class="col s10 offset-s1">
          <form class="card grey lighten-5">
            <div class="card-content">
              <span class="card-title">POST INFORMATION</span>
              <div class="container">
                <div class="row">
                  <div class="input-field col s12">
                    <label for="">type</label>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12">
                    <select id="type" name="type">
                      <option value="event">event</option>
                      <option value="maintenance">maintenance</option>
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12">
                    <label for="">service</label>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12">
                    <select id="service" name="service">
                      {% for service in services %}
                      <option value="{{ service }}">{{ service }}</option>
                      {% endfor %}
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12">
                    <label for="">begin</label>
                  </div>
                </div>
                <div class="row">
                  <div class="ipnut-field col s12">
                    <input class="datepicker" id="begin-date" name="begin-date" type="date" value="" type-date=""/>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s2">
                    <select id="begin-hour" name="begin-hour">
                      {% for i in range(24) %}
                      <option value="{% if i<10 %}0{% endif %}{{i}}">{{i}}時</option>
                      {% endfor %}
                    </select>
                  </div>
                  <div class="input-field col s2">
                    <select id="begin-minute" name="begin-minute">
                      {% for i in range(60) %}
                      <option value="{% if i<10 %}0{% endif %}{{i}}">{{i}}分</option>
                      {% endfor %}
                    </select>
                  </div>
                  <div class="input-field col s2">
                    <select id="begin-second" name="begin-second">
                      {% for i in range(60) %}
                      <option value="{% if i<10 %}0{% endif %}{{i}}">{{i}}秒</option>
                      {% endfor %}
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12">
                    <label for="">end</label>
                  </div>
                </div>
                <div class="row">
                  <div class="ipnut-field col s12">
                    <input class="datepicker" id="end-date" name="end-date" type="date" value="" type-date=""/>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s2">
                    <select id="end-hour" name="end-hour">
                      {% for i in range(24) %}
                      <option value="{% if i<10 %}0{% endif %}{{i}}">{{i}}時</option>
                      {% endfor %}
                    </select>
                  </div>
                  <div class="input-field col s2">
                    <select id="end-minute" name="end-minute">
                      {% for i in range(60) %}
                      <option value="{% if i<10 %}0{% endif %}{{i}}">{{i}}分</option>
                      {% endfor %}
                    </select>
                  </div>
                  <div class="input-field col s2">
                    <select id="end-second" name="end-second">
                      {% for i in range(60) %}
                      <option value="{% if i<10 %}0{% endif %}{{i}}">{{i}}秒</option>
                      {% endfor %}
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="col s12 input-field">
                    <label for="">detail</label>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12">
                    <textarea id="detail" class="materialize-textarea" cols="30" name="detail" rows="10" length="128"></textarea>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12">
                    <label for="apikey">api-key</label>

                    <input id="apikey" name="apikey" type="text" value=""/>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-action">
              <a href="/" class="btn">Cancel</a>
              <a class="btn" id="submit" name="submit">POST <i class="material-icons right">send</i></a>
            </div>
          </form>
        </div>
      </div>
    </main>
  </body>
</html>
