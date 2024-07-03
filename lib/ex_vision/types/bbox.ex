defmodule ExVision.Types.BBox do
  @moduledoc """
  A struct describing the bounding box returned by the object detection model.
  """

  @enforce_keys [:x1, :y1, :x2, :y2, :label, :score]
  defstruct @enforce_keys

  @typedoc """
  A type describing the Bounding Box object.

  Bounding box is a rectangle encompassing the region.
  When used in object detectors, this box will describe the location of the object in the image.

  - `x1` - x componenet of the upper left corner
  - `y1` - y componenet of the upper left corner
  - `x2` - x componenet of the lower right
  - `y2` - y componenet of the lower right
  - `score` - confidence of the predition
  - `label` - label assigned to this bounding box
  """
  @type t(label_t) :: %__MODULE__{
          x1: number(),
          y1: number(),
          y2: number(),
          x2: number(),
          label: label_t,
          score: number()
        }

  @typedoc """
  Exactly like `t:t/1`, but doesn't put any constraints on the `label` field:
  """
  @type t() :: t(term())

  @doc """
  Return the width of the bounding box
  """
  @spec width(t()) :: number()
  def width(%__MODULE__{x1: x1, x2: x2}), do: abs(x2 - x1)

  @doc """
  Return the height of the bounding box
  """
  @spec height(t()) :: number()
  def height(%__MODULE__{y1: y1, y2: y2}), do: abs(y2 - y1)
end
