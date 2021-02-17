<?php

	function average($a) { return array_sum($a) / sizeof($a); }

	function drawTable($fileName, $reverse = false, $precision = 3, $original = null)
	{
		// get the data
		$file = fopen($fileName . ".data", "r");

		$labels = $jvm = $baseline = $caching = array();
		$percent1 = $percent2 = array();
		$original = $original ? $original : "JVM";

		while ($row = fgets($file))
		{
			$t = split(', ', substr($row, 0, -1));

			$labels[] = $t[0];
			$jvm[] = $t[1];
			$baseline[] = $t[2];
			$caching[] = $t[3];
			if ($reverse)
			{
				$percent1[] = @round(100 * $t[2] / $t[1], 2);
				$percent2[] = @round(100 * $t[3] / $t[1], 2);
			} else {
				$percent1[] = @round(100 * $t[1] / $t[2], 2);
				$percent2[] = @round(100 * $t[1] / $t[3], 2);
			}
		}

		fclose($file);

		echo "<table class=\"benchmark\" width=\"100%\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\">";
		echo "<tr class=\"header\">";
		echo "<th style=\"white-space: nowrap; border-bottom: 1px solid #000;\">&nbsp;</th>";
		echo "<th style=\"border-bottom: 1px solid #000;\">$original</th>";
		echo "<th style=\"border-bottom: 1px solid #000;\">Nu (initial)</th>";
		echo "<th style=\"border-bottom: 1px solid #000;\">% of $original</th>";
		echo "<th style=\"border-bottom: 1px solid #000;\">Nu (current)</th>";
		echo "<th style=\"border-bottom: 1px solid #000;\">% of $original</th>";
		echo "</tr>";

		foreach ($labels as $i => $l)
		{
			echo "<tr>";
			echo "<th>", ($i + 1), ". $l</th>";
			echo "<td style=\"background-color: #eee;\">", number_format($jvm[$i], $precision), "</td>";
			echo "<td>", number_format($baseline[$i], $precision), "</td>";
			echo "<td style=\"background-color: #eee;\">$percent1[$i]%</td>";
			echo "<td>", number_format($caching[$i], $precision), "</td>";
			echo "<td style=\"background-color: #eee;\">$percent2[$i]%</td>";
			echo "</tr>";
		}

		if ($reverse)
		{
			$pct1 = @round(average($baseline) / average($jvm) * 100, 2);
			$pct2 = @round(average($caching) / average($jvm) * 100, 2);
		} else {
			$pct1 = @round(average($jvm) / average($baseline) * 100, 2);
			$pct2 = @round(average($jvm) / average($caching) * 100, 2);
		}

		echo "<tr>";
		echo "<th style=\"border-top: 1px solid #000;\">Average</th>";
		echo "<td class=\"bm-jvm\" style=\"background-color: #eee; border-top: 1px solid #000;\">", number_format(average($jvm), $precision), "</td>";
		echo "<td class=\"bm-baseline\" style=\"border-top: 1px solid #000;\">", number_format(average($baseline), $precision), "</td>";
		echo "<td class=\"bm-baseline\" style=\"background-color: #eee; font-weight: bold; border-top: 1px solid #000;\">$pct1%</td>";
		echo "<td class=\"bm-caching\" style=\"border-top: 1px solid #000;\">", number_format(average($caching), $precision), "</td>";
		echo "<td class=\"bm-caching\" style=\"background-color: #eee; font-weight: bold; border-top: 1px solid #000;\">$pct2%</td>";
		echo "</tr>";

		echo "</table>";
	}

?>
