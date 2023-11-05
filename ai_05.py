class State:
    def __init__(self, queens, n):
        self.queens = queens  # Positions of queens in each row
        self.n = n  # Board size

    def is_valid(self, row, col):
        for r, c in enumerate(self.queens):
            if c == col or abs(r - row) == abs(c - col):
                return False
        return True

    def get_children(self):
        children = []
        for col in range(self.n):
            if self.is_valid(len(self.queens), col):
                new_queens = self.queens + [col]
                children.append(State(new_queens, self.n))
        return children

    def heuristic(self):
        conflicts = 0
        for i in range(len(self.queens)):
            for j in range(i + 1, len(self.queens)):
                if self.queens[i] == self.queens[j] or abs(i - j) == abs(self.queens[i] - self.queens[j]):
                    conflicts += 1
        return conflicts

    def is_goal(self):
        return len(self.queens) == self.n

    def f(self):
        return len(self.queens) + self.heuristic()


class AStarNQueens:
    def __init__(self, n, start_row):
        self.n = n
        self.start_row = start_row
        self.open_set = []
        self.closed_set = set()

    def reconstruct_path(self, state):
        return state.queens

    def get_min_f_state(self):
        min_f = float('inf')
        min_state = None
        for f, state in self.open_set:
            if f < min_f:
                min_f = f
                min_state = state
        return min_state

    def astar(self):
        start_state = State([self.start_row], self.n)
        self.open_set.append((start_state.f(), start_state))

        while self.open_set:
            current_state = self.get_min_f_state()
            self.open_set.remove((current_state.f(), current_state))

            if current_state.is_goal():
                return self.reconstruct_path(current_state)

            self.closed_set.add(tuple(current_state.queens))

            for child in current_state.get_children():
                if tuple(child.queens) in self.closed_set:
                    continue

                self.open_set.append((child.f(), child))

        return None  # No solution found


# Get user input for the size of the chessboard
n = int(input("Enter the size of the chessboard (N): "))

# Get user input for the row where they want to place the first queen
start_row = int(input(f"Enter the row (0 to {n - 1}) to place the first queen: "))

# Check if the start row is within the valid range
if start_row < 0 or start_row >= n:
    print("Invalid start row. Please choose a row within the board size.")
else:
    astar = AStarNQueens(n, start_row)
    solution = astar.astar()

    if solution:
        print("Solution found:", solution)
    else:
        print("No solution found.")