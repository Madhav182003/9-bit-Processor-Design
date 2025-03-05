import re

def lexer(input_code):
    token_specification = [
        ('COMMENT', r'@\s*.*'),         # Comments
        ('NUMBER', r'\d+'),             # Integer
        ('REGISTER', r'r\d+'),          # Register
        ('OPCODE', r'\b(add|xor|lsl|lsr|mov|cmp|scm|adc|rad|not|blt|beq|moi|ldr|str|adf)\b'),  # Opcodes
        ('COMMA', r','),                # Comma
        ('HASH', r'#\d+'),              # Immediate values
        ('NEWLINE', r'\n'),             # Line endings
        ('SKIP', r'[ \t]+'),            # Skip spaces and tabs
        ('MISMATCH', r'.'),             # Any other character
    ]
    tok_regex = '|'.join('(?P<%s>%s)' % pair for pair in token_specification)
    line_num = 1
    line_start = 0
    for mo in re.finditer(tok_regex, input_code):
        kind = mo.lastgroup
        value = mo.group(kind)
        column = mo.start() - line_start
        if kind == 'NEWLINE':
            line_start = mo.end()
            line_num += 1
        elif kind in ('SKIP', 'COMMENT'):
            continue
        elif kind == 'MISMATCH':
            raise RuntimeError(f'{value!r} unexpected on line {line_num}')
        yield kind, value, line_num, column
