<?php
require_once("BibTex.php");

class BibTexDb extends Structures_BibTex {
		function entryToBibtex($obj, $entry) {
			$str = "@$entry[entryType]{" . "$entry[cite],\n";

			unset($entry['entryType']);
			unset($entry['cite']);

            if (array_key_exists('author', $entry)) {
				$tmparray = array();
				foreach ($entry['author'] as $authorentry)
					$tmparray[] = $obj->_formatAuthor($authorentry);
				$entry['author'] = join(' and ', $tmparray);
            }

			foreach ($entry as $key => $val)
                $str .= " " . "$key = {" . $obj->_unwrap($val) . "},\n";

			return $str . "}";
		}
}

$bibtex = new BibTexDb();
//$bibtex = new Structures_BibTex();
$ret = $bibtex->loadFile('foo.bib');

$bibtex->parse();

print "There are ".$bibtex->amount()." entries<br/>";

foreach ($bibtex->data as $entry)
{
	echo "<pre>";
//	var_dump($entry);
	echo BibTexDb::entryToBibtex($bibtex, $entry);
	echo "</pre>";
	echo "<br/>\n";
//	print $entry['title']."<br />";
}
?>
