import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

// Connects to data-controller="puzzle"
export default class extends Controller {
  connect() {
    const tiles = document.querySelectorAll("td");
    // Add event listener on each tile - Do not change the following
    tiles.forEach((tile) => {
      tile.addEventListener("click", () => {
        if (this.canMove(tile)) {
          this.moveTile(tile);
          this.checkIfPlayerWins();
        }
      });
    });
  };

  canMove(tile) {
    // TODO: Check if a tile has an empty neighbour
    const empty = document.querySelector(".empty");
    const xEmpty = empty.cellIndex;
    const yEmpty = empty.parentElement.rowIndex;
    const xTile = tile.cellIndex;
    const yTile = tile.parentElement.rowIndex;
    if (yEmpty === yTile && (xEmpty - xTile === 1 || xEmpty - xTile === -1)) {
      return true;
    }
    if (xEmpty === xTile && (yEmpty - yTile === 1 || yEmpty - yTile === -1)) {
      return true;
    }
    return false;
  };

  moveTile(element) {
    const empty = document.querySelector(".empty");
    empty.innerHTML = element.innerHTML;
    empty.classList.remove("empty");
    element.classList.add("empty");
    element.innerHTML = "";
  };

  checkIfPlayerWins() {
    // TODO: Check if player has won
    const rows = document.querySelectorAll("tr td");
    const winningCombination = [];
    console.log("wc: ", winningCombination);
    rows.forEach((row) => {
      console.log('lfg', row.innerHTML, typeof row.innerHTML);
      winningCombination.push(
        row.innerHTML === "" ? "" : parseInt(row.innerHTML, 10)
      );
    });

    const actualWinningComination = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      "",
    ];

    if (
      JSON.stringify(winningCombination)
      === JSON.stringify(actualWinningComination)
    ) {
      alert("Winner")

      const landId = this.element.dataset.landId;
      const userId = this.element.dataset.userId;
      console.log(userId);

      fetch(`/lands/${landId}/conquer`, {
        method: 'PATCH',
        headers: { "Content-Type": "application/json", "X-CSRF-Token": Rails.csrfToken() },
        body: JSON.stringify({ land: { user_id: userId }})
      }).then(response => response.json())
        .then((data) => {
          console.log(data);
          window.location.href = '/dashboard';
        } )
    }
  };
}
