function myFunction() {
	// alert(document.getElementById("exam").innerHTML);
	if (document.getElementById("exam").innerHTML == "변경전")
		document.getElementById("exam").innerHTML = "변경후"
	else
		document.getElementById("exam").innerHTML = "변경전"
}