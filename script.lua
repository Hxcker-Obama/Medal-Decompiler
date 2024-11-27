local API = "https://decompiler.ashore.rip/";

local Decompile = function(Script)
    local ScriptBytecode = getscriptbytecode(Script);

    if ScriptBytecode then
        local Output = request({
            Url = `{API}decompile`;
            Method = "POST";
            Body = ScriptBytecode;
        });
      
        if Output.StatusCode == 200 then
            return Output.Body;
        end;

        return `Failed to decompile bytecode\n{ScriptBytecode}`;
    end;
end;

getgenv().decompile = Decompile;
