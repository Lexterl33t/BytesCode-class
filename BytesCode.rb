class FileError < StandardError

end

class BytesCode

    def self.countdown(shellcode)
        shellcode_array = shellcode.split('\x')
        no_authorized = ["00", "FF", "0D", "0A", "ff", "0d", "0a"]
        final_rez = []
        shellcode_array.each do |bytes|
           
            no_authorized.each do |no_auth|
                if bytes == no_auth
                    shellcode_array.delete(bytes)
                end
            end
        end
    
        shellcode_array.each do |octet|
            if octet != ""
                final_rez << "\\x#{octet}"
            end
    
        end
        return final_rez.join
    
    end

    def self.to_opcode(file, countdown=false)

        if(File.file?(file) == false)
            raise FileError, "#{file} => File not found"
        end
        cmd = `objdump -d #{file} | grep "^ "|cut -f2`

        cmd_to_a = cmd.split(/\n/)


        testt = cmd_to_a.join("").split(" ")

        final_res = []
        testt.each do |data|
            final_res << "\\x#{data}"
        end

        if(countdown == false)
            return final_res.join
        else
            return self.countdown(final_res.join)
        end
    end

end




