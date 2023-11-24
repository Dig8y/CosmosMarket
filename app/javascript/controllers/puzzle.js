// Select all the tiles

const tiles = document.querySelectorAll("td");

const canMove = (tile) => {
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

const moveTile = (element) => {
  const empty = document.querySelector(".empty");
  empty.innerHTML = element.innerHTML;
  empty.classList.remove("empty");
  element.classList.add("empty");
  element.innerHTML = "";
};

const checkIfPlayerWins = () => {
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
    alert("winner 12");
  }
};

// Add event listener on each tile - Do not change the following
tiles.forEach((tile) => {
  tile.addEventListener("click", () => {
    if (canMove(tile)) {
      moveTile(tile);
      checkIfPlayerWins();
    }
  });
});
