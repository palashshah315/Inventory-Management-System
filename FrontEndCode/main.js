$(document).ready(function () {
			
});
removeItem = () => {
    const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                var res = this.responseText;
                alert(res);
               
            }
            const url = "";
            xhttp.open("GET", url);
            xhttp.send();
}