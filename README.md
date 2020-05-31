
# Instruction Assembly to Opcode- Library


## Getting Started

```
gem install BytesCode
```

```ruby
    require 'BytesCode'
```

## Convert Instruction asm to Opcode

```ruby
    BytesCode.to_opcode("executable")
```
###Delete bad chars with countdown



```ruby
BytesCode.to_opcode("executable", countdown=true) #by default is false
```

or

```ruby
BytesCode.countdown('\xeb\x1e\x5e\x48\x31\xc0\xb0\x01\x48\x89\xc7\x48\x89\xfa\x48\x83\xc2\x0e\x0f\x05\x48\x31\xc0\x48\x83\xc0\x3c\x48\x31\xff\x0f\x05\xe8\xdd\xff\xff\xff\x48\x65\x6c\x6c\x6f\x2c\x20\x77\x6f\x72\x6c\x64\x21\x0a')

#output => \xeb\x1e\x5e\x48\x31\xc0\xb0\x01\x48\x89\xc7\x48\x89\xfa\x48\x83\xc2\x0e\x0f\x05\x48\x31\xc0\x48\x83\xc0\x3c\x48\x31\x0f\x05\xe8\xdd\x48\x65\x6c\x6c\x6f\x2c\x20\x77\x6f\x72\x6c\x64\x21
```

##Binary test

```asm
global _start

_start:
    jmp short string


code:
    pop rsi
    xor rax, rax
    mov al, 1
    mov rdi, rax
    mov rdx, rdi
    add rdx, 14
    syscall

    xor rax, rax
    add rax, 60
    xor rdi, rdi
    syscall

string:
    call code
    db 'Hello, world!', 0x0A

```

## Screenshot of test
<p align="center">
  <img width="1050" height="500" src="https://github.com/MuhamRB/BytesCode-class/blob/master/2020-05-31_11-59.png">
</p>

<p align="center">
  <img width="900" height="500" src="https://github.com/MuhamRB/BytesCode-class/blob/master/2020-05-31_12-09.png">
</p>

## Authors

* **Muham RB** - *Initial work* - [MuhamRB](https://github.com/MuhamRB)

* **Muham RB** - *RubyGems* - [MuhamRB](https://rubygems.org/profiles/MuhamRB)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

