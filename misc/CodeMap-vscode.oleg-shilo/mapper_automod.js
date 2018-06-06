"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs");
class mapper {
    static read_all_lines(file) {
        let text = fs.readFileSync(file, 'utf8');
        return text.split(/\r?\n/g);
    }
    static generate(file) {
        let members = [];
        try {
            let line_num = 0;
            let image_index = 1;
            mapper
                .read_all_lines(file)
                .forEach(line => {
                line_num++;
                line = line.trimStart();
                if (line.startsWith("### "))
                    members.push(`${line.substr(4)}|${line_num}|level3`);
                else if (line.startsWith("begin ")){
                    var tmp = line.split(' ');
                    // members.push(`${line.substr(3) + tmp[0]}|${line_num}|level2`);
                    members.push(`${"   " + tmp[1] + " [" + tmp[2] + "]"}|${line_num}|level1`);
                }
                else if (line.startsWith("SFileBegin"))
                    members.push(`${"*Filename" +line.substr(15)}|${line_num}|level2`);
            });
        }
        catch (error) {
        }
        return members;
    }
}
exports.mapper = mapper;
//# sourceMappingURL=mapper_md.js.map