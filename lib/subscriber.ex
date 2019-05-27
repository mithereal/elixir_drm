defmodule Drm.Subscriber do
 @moduledoc false
  
    @type t :: %__MODULE__{}
  
    defstruct [
      :pid,
      :pattern,
      :count,
      :multi,
      :ref
    ]
  
    def new(pid, pattern, count, multi) do
      ref = make_ref()
  
      %__MODULE__{
        pid: pid,
        pattern: pattern,
        count: count,
        multi: multi,
        ref: ref
      }
    end
  end