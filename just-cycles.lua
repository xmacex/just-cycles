--- just cycles
-- track cycles of just friends
-- inputs
--   crow 1: pulse width
--   crow 2: unimplemented
-- outputs:
--   crow 1-4: pulses at jf 1-4 eocs
--   jf 6: slope at jf 5 eoc

function log(name, s)
   if DEBUG then print("📓 "..name..": "..s) end
end

DEBUG = false

-- initialization

prev_states = {0, 0, 0, 0, 0}

function init()
   for i=1,4 do
      output[i].action = "pulse()"
   end
   
   eoc_poll = metro.init(jf_eocs, 1/111)
   eoc_poll:start()
   
   input[1].mode('stream')
   input[1].stream = change_pulse_width
   -- input[2].mode('stream', 1)
   -- input[2].stream = change_poll_rate
end

-- crow input handlers

function change_pulse_width(v)
   local pw = math.max(0.01, v * 0.01)
   -- log("pw", pw)
   for i=1,4 do
      output[i].action = "pulse("..pw..")"
   end
end

function change_poll_rate(v)
   jf_prate = 1/(v*10)
   log("jf prate", jf_prate)
   eoc_poll.time = jf_prate
end

-- interface with jf

function getter_callback(e, value)
   if prev_states[e.arg] == 1 and value == 0 then
      if e.arg <= 4 then
         output[e.arg]()
      elseif e.arg == 5 then
         -- log("jf5", "⋅")
         ii.jf.trigger(6, 1)
      end
   end
   prev_states[e.arg] = value
end
ii.jf.event = getter_callback

function jf_eocs()
   for i=1,5 do
      ii.jf.get('trigger', i)
   end
end
