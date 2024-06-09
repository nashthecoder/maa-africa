// app/javascripts/components/toggle_view.js

document.addEventListener("DOMContentLoaded", function() {
    const toggleButton = document.getElementById("toggle-view");
    if (toggleButton) {
        const tableView = document.getElementById("table-view");
        const cardView = document.getElementById("card-view");
    
        toggleButton.addEventListener("click", function() {
            if (tableView.style.display === "block") {
            tableView.style.display = "none";
            cardView.style.display = "block";
            toggleButton.textContent = "Switch to Table View";
            } else {
            tableView.style.display = "block";
            cardView.style.display = "none";
            toggleButton.textContent = "Switch to Card View";
            }
        });
        }
    });
