for each V_load in V_loadlist do begin
    if V_load A_dest = V_loc then begin
        order V_load from OL_loadlist to continue
        break
    end
end