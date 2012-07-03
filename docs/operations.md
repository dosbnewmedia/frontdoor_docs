
# Operationen

## Alle Resourcen eines Typs abfragen

Um alle Resourcen eines Typs abzufragen muss eine GET-Anfrage auf den Pfad */resource/[resourcetyp]* erfolgen.

	$ curl 'https://api.splink.de/resource/events?access_token=…'

Die Serverantwort enthält Metainformationen sowie einen Array mit den gefundenen Resourcen:

	{
		"query_time": "0.018635843",
		"result_count": 201,
		"result": [{
			"id": "12e3d2b758c74764b4df596ecb586fbb",
			"type": "Event",
			"created_from": "ee2d7e19135949dd82a6e792c4fd4ca0",
			"created_by": "12dd98ad6a4444d6b679acdc0d55ecff",
			"created_at": "2012-04-03T16:51:41+0200",
			…
		}, …]
	}


### Paginierung

Bei großen Datenbeständen ist es von Vorteil, die Ergebnisse paginiert abzufragen, um Datenmenge und Antwortzeit zu reduzieren. Dazu können die beiden Parameter *page* und *pageSize* genutzt werden:

	 $ curl 'https://api.splink.de/resource/events?page=3&pageSize=10&access_token=…'

Dabei wird die Serverantwort um zusätzliche Informationen angereichert, die eine Paginierung zu erleichtern:

	{
		"page": 3,
		"page_count": 21,
		"page_size": 10,
		"query_time": "0.020436840",
		"result_count": 201,
		"result": [{ … }]
	}


## Eine Resource abfragen

Um Informationen zu einer einzigen Resource abzufragen, kann die ID genutzt werden, um eine Serveranfrage in der Form */resource/[resourcetyp]/[id]* zu stellen:

	$ curl 'https://api.splink.de/resource/events/12e3d2b758c74764b4df596ecb586fbb?access_token=…'

In der Serverantwort ist das Result-Attribut kein Array, sondern enthält direkt den gefunden Termin:

	{
		"query_time": "0.001986492",
		"result_count": 1,
		"result": {
			"id": "12e3d2b758c74764b4df596ecb586fbb",
			"type": "Event",
			…

Wenn keine Resource mit der übermittelten ID gefunden wird, antwortet der Server mit einem entsprechenden Response Code im Header:

	HTTP/1.1 404 Not Found


## Neue Resource erstellen

Über einen POST auf die URL */resource/[resourcetyp]* kann eine neue Resource vom jeweiligen Typ erstellt werden. Die notwendigen Attribute der neuen Resource werden im JSON-Format mitgeschickt:

	$ curl -vd '{"name": "Basketbll am Stadion", "sport_id": "38d9af9f54504597b2fb2a08d39a76c5", "facility_id": "8522b0a08e8b469eb9b16edc9d4f4d5e", "starts_at": "2012-10-20T08:30:00+0200", "ends_at": "2012-10-20T13:00:00+0200"}' 'https://api.splink.de/resource/events?access_token=…'

Die Serverantwort enthält im Header die ID der erstellten Resource in Form der internen Datenbank-URL. Die ID kann aus dieser URL extrahiert werden. Beispiel:

	HTTP/1.1 201 Created
	location: http://localhost:8081/splink_sgdb/api/events/21567a64adf248b98b39f34ddc147606

Im Fall eines Fehlers, zum Beispiel das Fehlen des Enddatums liefert die API einen entsprechenden Header sowie eine Information im JSON-Format zurück:

	HTTP/1.1 422 Unprocessable Entity
	{
		"code": 422,
		"errors": {
			"Event": {
				"ends_at": [
					"must_not_be_empty"
	]}}}


## Existierende Resource bearbeiten

Über einen PUT auf die URL */resource/[resourcetyp]/[id]* kann eine existierende Resource bearbeitet werden.

	$ curl -X PUT -vd '{name:" Basketball am Stadion "}' 'https://api.splink.de/resource/events/21567a64adf248b98b39f34ddc147606?access_token=…'

Nachdem die Resource erfolgreich editiert wurde liefert der Server einen entsprechenden Header zurück:

	HTTP/1.1 200 OK

Wenn die übermittelten Daten fehlerhaft sind und ein Editieren nicht zulassen, wird analog zum Erstellen die notwendige Fehlerinformation als JSON vom Server zurückgeschickt.
