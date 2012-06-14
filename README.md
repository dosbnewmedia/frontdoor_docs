Dokumentation der API
=====================

Vorraussetzung für den lokalen Server sind Node.js und NPM.

	$ git clone git@github.com:dosbnewmedia/frontdoor_docs.git
	$ cd frontdoor_docs

Module installieren:

	$ npm install

Um CoffeeScript zu nutzen muss entweder der lokale .bin-Ordner zum PATH hinzufgefügt werden

	$ export PATH="./node_modules/.bin:$PATH"

oder CoffeeScript global installiert werden

	$ npm install -g coffee-script

Server starten und API-Seite öffnen:

	$ coffee index
	$ open http://localhost:5000

