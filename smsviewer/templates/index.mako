<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <link rel="stylesheet" href="/static/css/normalize.css">
        <link rel="stylesheet" href="/static/css/main.css">
        <link rel="stylesheet" href="/static/css/styles.css">
        <script src="/static/js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
        <% import datetime %>
        <% import ago %>
        <% sender = None %>
        % for message in messages:
            <% this_sender = "brian" if message.get("type") == "2" else "lacey" %>
            <div class="${this_sender} message">
                % if message.get("date") is None:
                    <% import pdb; pdb.set_trace() %>
                % endif
                <h3>
                    <% ts = datetime.datetime.fromtimestamp(int(message.get("date"))/1000) %>
                    <% human = ago.human(ts) %>
                    <% strf = ts.strftime('%Y-%m-%d %H:%M:%S') %>
                    ${this_sender} @ <abbr title="${strf}">${human}</abbr>
                </h3>
                % if message.tag == "mms":
                    an_mms
                   <% img = message.xpath("parts/part[@data]")[0] %>
                   <img style="width: 100%;" src="${"data:" + img.get("ct") + ";base64," + img.get("data")}">
                % endif

                % if message.get("body") is not None:
                    <p>${message.get("body")}</p>
                % endif
            </div>

            <% sender = this_sender %>
        % endfor

        <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>-->
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="/static/js/plugins.js"></script>
        <script src="/static/js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X');ga('send','pageview');
        </script>
    </body>
</html>
