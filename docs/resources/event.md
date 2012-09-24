# Termin

Interner Name: *event*

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
		<td>Der Name des Termins</td>
	</tr>

	<tr>
		<td><strong>starts_at</strong></td>
		<td align="center">✔</td>
		<td align="center">✔</td>
		<td align="center">✔</td>
		<td>Das Startdatum des Termins</td>
	</tr>

	<tr>
		<td><strong>ends_at</strong></td>
		<td align="center">✔</td>
		<td align="center">✔</td>
		<td align="center">✔</td>
		<td>Das Enddatum des Termins. Muss nach dem Startdatum liegen.</td>
	</tr>

	<tr>
		<td><strong>description</strong></td>
		<td align="center">✔</td>
		<td align="center"></td>
		<td align="center">✔</td>
		<td>Die Beschreibung des Termins</td>
	</tr>

	<tr>
		<td><strong>user_id</strong></td>
		<td align="center">✔</td>
		<td align="center"></td>
		<td align="center">✔</td>
		<td>Die UUID des Authors</td>
	</tr>

	<tr>
		<td><strong>sport_id</strong></td>
		<td align="center">✔</td>
		<td align="center"></td>
		<td align="center">✔</td>
		<td>Die UUID der Sportart dieses Termins</td>
	</tr>

	<tr>
		<td><strong>facility_id</strong></td>
		<td align="center">✔</td>
		<td align="center"></td>
		<td align="center">✔</td>
		<td>Die UUID der Sportstätte diese Termins</td>
	</tr>

	<tr>
		<td><strong>event_status</strong></td>
		<td align="center"></td>
		<td align="center">✔</td>
		<td align="center"></td>
		<td>Der Status des Termins, enthält einen der folgenden Werte: "past", "current", "upcoming"</td>
	</tr>
</table>

