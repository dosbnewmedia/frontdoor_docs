
# Testumgebung

Während der Entwicklung dürfen Anfragen nicht gegen die Production-API unter api.splink.de gerichtet werden. Zu diesem Zweck existiert unter *http://api.testing.splink.de* eine Testumgebung, die während dieser Zeit genutzt werden kann und soll.

Es gibt ebenso die splink-Website in einer Testumgebung, die die Datenbank der Testumgebung nutzt. Diese ist unter *http://testing.splink.de* erreichtbar.

Alle Zugriffe auf die Testumgebung, sowohl die API als auch die Website müssen zusätzlich über BasicAuth authentifiziert werden. Die Zugangsdaten erhalten Sie von uns auf Anfrage.

**Hinweis** Es ist zu beachten, dass die Testumgebung im Gegensatz zum Produktivsystem über HTTP anstatt HTTPS erreichbar ist. Dies gilt ebenfalls sowohl für die API als auch die Testversion von splink.de.
