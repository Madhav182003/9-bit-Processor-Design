opcode_mapping = {
    'add': '0001',
    'xor': '0011',
    'lsl': '0100',
    'lsr': '0101',
    'mov': '0110',
    'cmp': '0111',
    'scm': '1000',
    'adc': '1011',
    'rad': '1100',
    'not': '0010',
    'blt': '1001',
    'beq': '0000',
    'moi': '1010',
    'ldr': '1111',
    'str': '1110',
    'adf': '1101',
}

def generate_machine_code(ast):
    machine_code = []
    for instruction in ast:
        opcode = opcode_mapping[instruction['opcode']]
        args = instruction['args']
        print(f"Processing instruction: {instruction}")  # Debugging output

        if instruction['opcode'] in ['add', 'xor', 'mov', 'cmp', 'scm', 'adc', 'rad', 'not', 'adf']:
            # Instructions with 2-bit destination register and 3-bit source register
            reg1 = f'{int(args[0][1]):02b}'
            reg2 = f'{int(args[1][1]):03b}' if args[1][0] == 'r' else f'{int(args[1]):05b}'
            machine_code.append(f'{opcode}{reg1}{reg2}')
        
        elif instruction['opcode'] in ['lsl', 'lsr']:
            # Instructions with 3-bit register and 2-bit immediate
            reg = f'{int(args[0][1]):03b}'
            imm_str = args[1].lstrip("#")
            if not imm_str.isdigit():
                raise ValueError(f"Invalid immediate value: {args[1]}")
            imm = f'{int(imm_str):02b}'
            machine_code.append(f'{opcode}{reg}{imm}')
        
        elif instruction['opcode'] == 'moi':
            # 'moi' with 3-bit register and 3-bit immediate
            reg = f'{int(args[0][1]):02b}'
            imm_str = args[1].lstrip("#")
            if not imm_str.isdigit():
                raise ValueError(f"Invalid immediate value: {args[1]}")
            imm = f'{int(imm_str):03b}'
            machine_code.append(f'{opcode}{reg}{imm}')
        
        elif instruction['opcode'] in ['blt', 'beq']:
            # Branch instructions with 5-bit immediate
            imm = args[0]
            machine_code.append(f'{opcode}{imm}')
        
        elif instruction['opcode'] in ['ldr', 'str']:
            # Load/Store instructions with 5-bit immediate
            imm = args[0]
            machine_code.append(f'{opcode}{imm}')
        
    return machine_code
