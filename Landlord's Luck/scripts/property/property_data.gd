class_name PropertyData
extends Resource

@export var property_name: String
@export var property_cost: float
## Rent per Week
@export var property_rent: float
@export var rent_rate: TimeFrame.Times
@export var popularity: float

var building: Property.PropertyType = Property.PropertyType.LAND

## Variant = PropertyUtilities or null
var utilities: Dictionary[PropertyUtilities.UtilTypes, Variant]

var advertising_upgrades: Array[AdvertisingUpgrade] = []
var looks_upgrades: Array[LooksUpgrade] = []
var money_upgrades: Array[MoneyUpgrade] = []
