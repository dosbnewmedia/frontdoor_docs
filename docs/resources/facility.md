# Sportstätte

Interner Name: *facility*

Die Kombination aus *name*, *street*, *city* und *state* muss eindeutig sein.

Die Attribute *latitude* und *longitude* werden automatisch über eine Geocoding-Suche mithilfe der übermittelten Adressdaten befüllt

## Öffentliche Attribute


<table>
	<tr>
		<th align="left">Name</th>
		<th>Pflicht</th>
		<th>Durchsuchbar</th>
		<th>Schreibbar</th>
		<td>Beschreibung</td>
	</tr>

	<tr>
		<td><strong>name</strong></td>
		<td align="center">✔</td>
		<td align="center">✔</td>
		<td align="center">✔</td>
		<td>Der Name der Sportstätte</td>
	</tr>

	<tr>
		<td><strong>street</strong></td>
		<td align="center">✔</td>
		<td align="center"></td>
		<td align="center">✔</td>
		<td>Die Straße der Sportstätte</td>
	</tr>

	<tr>
		<td><strong>postal_code</strong></td>
		<td align="center">✔</td>
		<td align="center"></td>
		<td align="center">✔</td>
		<td>Die Postleitzahl der Sportstätte</td>
	</tr>

	<tr>
		<td><strong>city</strong></td>
		<td align="center">✔</td>
		<td align="center">✔</td>
		<td align="center">✔</td>
		<td>Die Stadt der Sportstätte</td>
	</tr>

	<tr>
		<td><strong>state</strong></td>
		<td align="center">✔</td>
		<td align="center">✔</td>
		<td align="center">✔</td>
		<td>Das Bundesland der Sportstätte</td>
	</tr>

	<tr>
		<td><strong>latitude</strong></td>
		<td align="center"></td>
		<td align="center"></td>
		<td align="center"></td>
		<td>Der Breitengrad der Geolocation der Sportstätte</td>
	</tr>

	<tr>
		<td><strong>longitude</strong></td>
		<td align="center"></td>
		<td align="center"></td>
		<td align="center"></td>
		<td>Der Längengrad der Geolocation der Sportstätte</td>
	</tr>

	<tr>
		<td><strong>related_sport_ids</strong></td>
		<td align="center"></td>
		<td align="center"></td>
		<td align="center"></td>
		<td>Der UUIDs der Sportarten, die mit dieser Sportstätte in Verbindung gebracht werden können</td>
	</tr>

	<tr>
		<td><strong>last_checkin_ids</strong></td>
		<td align="center"></td>
		<td align="center"></td>
		<td align="center"></td>
		<td>Die UUIDs der letzten 10 Check-Ins bei Terminen, die an dieser Sportstätte stattfinden</td>
	</tr>

	<tr>
		<td><strong>teaser_team_ids</strong></td>
		<td align="center"></td>
		<td align="center"></td>
		<td align="center"></td>
		<td>Die UUIDs von 3 zufälligen Vereinen, die zu dieser Sportstätte gehören</td>
	</tr>

	<tr>
		<td><strong>teaser_event_ids</strong></td>
		<td align="center"></td>
		<td align="center"></td>
		<td align="center"></td>
		<td>Die UUIDs von 3 zufälligen Terminen, die an dieser Sportstätte stattfinden</td>
	</tr>

</table>

