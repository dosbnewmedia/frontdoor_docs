
# Testumgebung

Während der Entwicklung dürfen Anfragen nicht gegen die Production-API unter api.splink.de gerichtet werden. Zu diesem Zweck existiert unter *http://api.testing.splink.de* eine Testumgebung, die während dieser Zeit genutzt werden kann und soll.

Es gibt ebenso die splink-Website in einer Testumgebung, die die Datenbank der Testumgebung nutzt. Diese ist unter *http://testing.splink.de* erreichtbar.

Alle Zugriffe auf die Testumgebung, sowohl die API als auch die Website müssen zusätzlich über BasicAuth authentifiziert werden. Bitte wenden Sie sich an team@splink.de um die Zugangsdaten für die Entwicklungsumgebung zu erhalten.

Die Testumgebung ist im Gegensatz zum Produktivsystem über HTTP anstatt HTTPS erreichbar ist. Dies gilt sowohl für die API als auch die Testversion von splink.de.

	$ curl -u 'username:password' http://api.testing.splink.de/version?access_token=07c20c9582b4e954d377b21a119a7f05
	
	{
	  "code": 200,
	  "message": "0.6.6.2"
	}
	