class Parse:
    def __init__(self, tokens):
        self.tokens = tokens
        self.pos = 0

    def consume(self, expected_type):
        token_type, token_value, _, _ = self.tokens[self.pos]
        if token_type == expected_type:
            self.pos += 1
            return token_value
        else:
            raise SyntaxError(f'Expected {expected_type}, got {token_type}')

    def parse_instruction(self):
        opcode = self.consume('OPCODE')
        args = []
        while self.pos < len(self.tokens) and self.tokens[self.pos][0] != 'NEWLINE':
            if self.tokens[self.pos][0] in ('REGISTER', 'NUMBER', 'HASH'):
                args.append(self.tokens[self.pos][1])
            self.pos += 1
        if self.pos < len(self.tokens) and self.tokens[self.pos][0] == 'NEWLINE':
            self.pos += 1
        return {'opcode': opcode, 'args': args}

    def parse(self):
        instructions = []
        while self.pos < len(self.tokens):
            if self.tokens[self.pos][0] == 'NEWLINE':
                self.pos += 1
                continue
            instructions.append(self.parse_instruction())
        return instructions
