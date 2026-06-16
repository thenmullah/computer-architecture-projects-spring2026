# Voting Machine in Assembly Language

## Overview

This project is a command-line Voting Machine developed using Assembly Language. The system allows users to cast votes for predefined candidates, counts the votes, and displays the final election results.

The project demonstrates fundamental Assembly Language concepts such as loops, conditional statements, procedures, data storage, user input handling, and output display.

## Features

* Display a list of candidates
* Allow users to cast votes
* Prevent invalid voting options
* Store and count votes
* Display election results
* Determine the winning candidate

## Technologies Used

* Assembly Language
* MASM/TASM (update according to your assembler)
* DOSBox or EMU8086 (if applicable)

## System Requirements

* Windows operating system
* MASM, TASM, or EMU8086 installed
* DOSBox (if using MASM or TASM)



## How to Run

### Using EMU8086

1. Open EMU8086.
2. Load the `voting.asm` file.
3. Assemble the source code.
4. Run the program.

### Using MASM and DOSBox

1. Open DOSBox.
2. Navigate to the project directory.
3. Assemble the program:

```bash
masm voting.asm;
```

4. Link the object file:

```bash
link voting.obj;
```

5. Execute the program:

```bash
voting.exe
```

## Program Workflow

1. Display the voting menu.
2. Show the list of candidates.
3. Accept the user's vote.
4. Validate the entered option.
5. Update the vote count.
6. Display the final results.
7. Announce the winner.

## Example Output

```text
===== VOTING MACHINE =====

1. Candidate A
2. Candidate B
3. Candidate C

Enter your vote: 2

Vote recorded successfully.

===== RESULTS =====

Candidate A: 3 votes
Candidate B: 5 votes
Candidate C: 2 votes

Winner: Candidate B
```

## Future Improvements

* Add password-protected administrator access
* Allow multiple voters with voter identification
* Store results in a file
* Add a graphical user interface

## Author

Name:Naeem ullah

Course: Computer Architecture

University: Iqra University Islamabad

