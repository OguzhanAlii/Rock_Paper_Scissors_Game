import "dart:io";
import "dart:math";

enum Moves { Rock, Paper, Scissors }

void main(List<String> args) {
  print("<<<<<<<<<<<    Welcome to AOP's game hell  >>>>>>>> ");
  List scoreboard = [0, 0];
  int value = 3;
  do {
    print("<<<<<<<<<<<    Please make your selection  >>>>>>>>");
    String selection = ChoosePlayerMove();
    print("Selection $selection");
    String ComputerSelection = ChooseComputerMove();

    print("Choice of computer : $ComputerSelection");

    scoreboard = Game_Controller(selection, ComputerSelection,
        p_scor: scoreboard[0], c_scor: scoreboard[1]);
    print("Player score is :" + scoreboard[0].toString());
    print("Computer score is :" + scoreboard[1].toString());

    if (scoreboard[0] == scoreboard[1] && scoreboard[0] >= 2) {
      value++;
      print("!!!  This Game is Long !!!");
    }
    if (scoreboard[0] == value) {
      print("*******  You win the game  *******");
    } else if (scoreboard[1] == value) {
      print("*******  You lost the game  *******");
    }
  } while (scoreboard[0] < value && scoreboard[1] < value);
}

String ChoosePlayerMove() {
  String input = stdin.readLineSync()!.toLowerCase();
  String move = "!! Invalid selection. Please choose one of the options !!";
  if (input == "rock") {
    move = Moves.Rock.toString().split('.').last;
  } else if (input == "paper") {
    move = Moves.Paper.toString().split('.').last;
  } else if (input == "scissors") {
    move = Moves.Scissors.toString().split('.').last;
  } else {
    
  }

  return move;
}

String ChooseComputerMove() {
  Random random = new Random();

  int num = random.nextInt(3);
  String move = "";

  if (num == 0) {
    move = Moves.Rock.toString().split('.').last;
  } else if (num == 1) {
    move = Moves.Paper.toString().split('.').last;
  } else if (num == 2) {
    move = Moves.Scissors.toString().split('.').last;
  }
  return move;
}

List Game_Controller(String Player_move, String Computer_move,
    {int p_scor = 0, int c_scor = 0}) {
  if (Player_move == Computer_move) {
    print("--You made the same choice as your opponent! Please continue.--");
  } else if (Player_move == "Rock" && Computer_move == "Paper") {
    c_scor++;
    print("--Your opponent computer got one point--");
  } else if (Player_move == "Rock" && Computer_move == "Scissors") {
    p_scor++;
    print("--You got a point against your opponent computer--");
  } else if (Player_move == "Paper" && Computer_move == "Rock") {
    p_scor++;
    print("--You got a point against your opponent computer--");
  } else if (Player_move == "Paper" && Computer_move == "Scissors") {
    c_scor++;
    print("--Your opponent computer got one point--");
  } else if (Player_move == "Scissors" && Computer_move == "Rock") {
    c_scor++;
    print("--Your opponent computer got one point--");
  } else if (Player_move == "Scissors" && Computer_move == "Paper") {
    p_scor++;
    print("--You got a point against your opponent computer--");
  }
  return [p_scor, c_scor];
}
