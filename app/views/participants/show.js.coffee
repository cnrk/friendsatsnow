$("#content").html '
<h2>Danke für deine Anmeldung!</h2>
<div id="text">
<img id="wenger" src="/assets/wenger.png"/>
<p>Wir haben dir ein Mail an <%= @participant.email %> geschickt mit allen Angaben
 zur Einzahlung und zum Wochenende. </p>
<p>Das ist natürlich nur eine Demo-App und wir werden jetzt nicht wirklich skifahren gehen..</p>
<p>Bei Fragen melde dich bei uns: <a href="mailto:friendsatsnow@gmail.com">friendsatsnow@gmail.com</a></p>
</div>
<p id="navlink"><%= link_to raw("Zur&uuml;ck zur Startseite"), url_for(:root), remote: true %></p>
'
