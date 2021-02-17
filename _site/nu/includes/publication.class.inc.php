<?php
	/**
	 * 
	 */
	class Publication
	{
		/**
		 * 
		 */
		var $title;

		/**
		 * 
		 */
		var $authors;

		/**
		 * 
		 */
		var $event;

		/**
		 * 
		 */
		var $date;

		/**
		 * 
		 */
		var $location;

		/**
		 * 
		 */
		var $pdf;

		/**
		 * 
		 */
		var $prev;

		/**
		 * 
		 */
		var $prevPdf;


		/**
		 * Creates a new publication entry.
		 * 
		 * @param $title		
		 * @param $authors		
		 * @param $date			
		 * @param $event		(default: @c null)
		 * @param $location		(default: @c null)
		 * @param $pdf			(default: @c null)
		 * @param $prev			(default: @c null)
		 * @param $prevPdf		(default: @c null)
		 */
		function Publication($title, $authors, $date, $event = null, $location = null, $pdf = null, $prev = null, $prevPdf = null)
		{
			$this->title = $title;
			$this->authors = $authors;
			$this->date = $date;
			$this->event = $event;
			$this->location = $location;
			if ($pdf !== null && strpos($pdf, "http://") == -1)
				$pdf = "http://www.cs.iastate.edu/$pdf";
			$this->pdf = $pdf;
			$this->prev = $prev;
			$this->prevPdf = $prevPdf;
		}


		/**
		 * Returns a string representation for this publication.
		 *
		 * @return a formatted string representation of this publication
		 */
		function format()
		{
			// format the link for the PDF
			$ext = strtoupper(substr($this->pdf, strrpos($this->pdf, '.') + 1));
			if ($ext == "HTML")
			$ext = "PDF";
			$pdf = $this->pdf ? " [<a href=\"$this->pdf\">$ext</a>]" : "";

			// format the link for the PDF for the previous version
			$ext = strtoupper(substr($this->prevPdf, strrpos($this->prevPdf, '.') + 1));
			if ($ext == "HTML")
			$ext = "PDF";
			$prevPdf = $this->prevPdf ? " [<a href=\"$this->prevPdf\">$ext</a>]" : "";

			// format the text for the previous version
			$prev = $this->prev ? "<br/><br/><span style=\"font-style: italic;\">Previous version appeared as $this->prev</span>" : "";
			$prevPdf = $this->prevPdf ? $prevPdf : "";

			// format the authors
			$authors = implode(', ', $this->authors);
			if (sizeof($this->authors) > 1)
				$authors = substr_replace($authors, ' and', strrpos($authors, ','), 1);

			$location = $this->location ? "$this->location." : "";

			// format the entire publication
			return $authors . ', "' . $this->title . '", ' . $this->event . ', '
				. date("M d, Y", $this->date) . ". $location$pdf$prev$prevPdf";
		}
	}


	/**
	 * A technical report.
	 */
	class TechReport extends Publication
	{
	}


	/**
	 * A poster presentation.
	 */
	class Poster extends Publication
	{
		/** @overload Publication::__construct */
		function Poster($title, $authors, $date, $event = null, $location = null, $pdf = null, $prev = null, $prevPdf = null)
		{
			$event = $event ? "Poster presentation at the $event" : null;
			parent::Publication($title, $authors, $date, $event, $location, $pdf, $prev, $prevPdf);
		}
	}


	/**
	 * A poster paper publication.
	 */
	class PosterPaper extends Publication
	{
		/** @overload Publication::__construct */
		function PosterPaper($title, $authors, $date, $event = null, $location = null, $pdf = null, $prev = null, $prevPdf = null)
		{
			$event = $event ? "A short poster paper in the $event" : null;
			parent::Publication($title, $authors, $date, $event, $location, $pdf, $prev, $prevPdf);
		}
	}


	/**
	 * A thesis publication.
	 */
	class Thesis extends Publication
	{
	}


	/**
	 * A journal publication.
	 */
	class Journal extends Publication
	{
		function Journal($title, $authors, $date, $journal, $volume, $issue, $pdf = null, $prev = null, $prevPdf = null)
		{
			$journal = $journal ? "In $journal, Vol. $volume, Issue $issue" : null;
			parent::Publication($title, $authors, $date, $journal, "", $pdf, $prev, $prevPdf);
		}
	}


	/**
	 * A conference proceedings publication.
	 */
	class Conference extends Publication
	{
		/** @overload Publication::__construct */
		function Conference($title, $authors, $date, $event = null, $location = null, $pdf = null, $prev = null, $prevPdf = null)
		{
			$event = $event ? "In $event" : null;
			parent::Publication($title, $authors, $date, $event, $location, $pdf, $prev, $prevPdf);
		}
	}


	/**
	 * A workshop publication.
	 */
	class Workshop extends Conference
	{
	}


	/**
	 * A presentation (perhaps of a paper).
	 */
	class Presentation extends Publication
	{
		/** @overload Publication::__construct */
		function Presentation($title, $authors, $date, $event = null, $location = null, $pdf = null, $prev = null, $prevPdf = null)
		{
			$event = $event ? "Presentation at the $event" : null;
			parent::Publication($title, $authors, $date, $event, $location, $pdf, $prev, $prevPdf);
		}
	}


	//
	// HELPER FUNCTIONS
	//

	/**
	 * Flattens all publications into 1 array (instead of an array of arrays)
	 * useful for building a list of recent publications.
	 *
	 * @param $papers	the publications to be flattened
	 * @return a flattened 1-dimensional array of publications
	 */
	function flattenPubs($papers)
	{
		$arr = array();

		foreach ($papers as $type => $entries)
			$arr = array_merge($arr, (array)$entries);

		return $arr;
	}


	/**
	 * Sorts publications by date.
	 *
	 * @param $a		one publication to be compared
	 * @param $b		the second publication to be compared
	 * @return @c true of $a is older than $b, else @c false
	 */
	function pubSort($a, $b)
	{
		return $a->date <= $b->date;
	}


	/**
	 * Returns a set of publications that are all by a certain author.
	 *
	 * @param $pubs		the publications to be filtered
	 * @param $author	the author whose publications should be returned
	 * @return a filtered set of the publications containing only publications by the specified author
	 */
	function filterPubsByAuthor($pubs, $author)
	{
		$pubs2 = array();

		foreach ($pubs as $type => $entries)
		{
			$pubs2[$type] = array();
			foreach ($entries as $entry)
				if (in_array($author, $entry->authors))
					$pubs2[$type][] = $entry;
		}

		return $pubs2;
	}


	/**
	 * Draws a set of publications grouped by type.
	 *
	 * @param $pubs		the publications to b drawn
	 */
	function drawPubsGrouped($pubs)
	{
		foreach ($pubs as $type => $entries)
			if (sizeof($entries))
			{
				echo "<h2 class=\"publications\">$type</h2>\n<ul class=\"publications\">\n";

				foreach ($entries as $entry)
					echo "\t<li>", $entry->format(), "</li>\n";

				echo "</ul>\n\n";
			}
	}


	/**
	 * Draws a set of publications without any grouping.
	 *
	 * @param $pubs		the publications to b drawn
	 */
	function drawPubsFlat($pubs)
	{
		$pubs = flattenPubs($pubs);
		usort($pubs, 'pubSort');

		echo "<ul class=\"publications\">\n";

		foreach ($pubs as $entry)
			echo "\t<li>", $entry->format(), "</li>\n";

		echo "</ul>\n";
	}
?>
