class FileError < StandardError

end

class BytesCode

    def self.to_opcode(file)

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

        return final_res.join
    end

end


