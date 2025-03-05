from lexer import lexer
from Parse import Parse
from code_generator import generate_machine_code

def read_input_file(input_file):
    with open(input_file, 'r') as file:
        return file.read()

def write_output_file(output_file, machine_code):
    with open(output_file, 'w') as file:
        for line in machine_code:
            file.write(f"{line}\n")

def main(input_file, output_file):
    code = read_input_file(input_file)
    tokens = list(lexer(code))
    parser = Parse(tokens)
    ast = parser.parse()
    machine_code = generate_machine_code(ast)
    write_output_file(output_file, machine_code)

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 3:
        print("Usage: python main.py <input_file> <output_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    main(input_file, output_file)
