package lasagna

// TODO: define the 'PreparationTime()' function
func PreparationTime(layers []string, timePerLayer int) int {
	if timePerLayer == 0 {
		timePerLayer = 2
	}
	
	return len(layers) * timePerLayer
}

// TODO: define the 'Quantities()' function
func Quantities(layers []string) (noodles int, sauce float64){
	for _, v := range layers {
		if v == "noodles"{
			noodles += 50
		} else if v == "sauce" {
			sauce += 0.2
		}
	}
	return noodles,sauce
}

// TODO: define the 'AddSecretIngredient()' function
func AddSecretIngredient(friendList []string, myList  []string){ 
	myList[len(myList) - 1] = friendList[len(friendList) - 1]
}



// TODO: define the 'ScaleRecipe()' function
func ScaleRecipe(amounts []float64, quantities int) (scaledQuantities []float64){
	scaledQuantities = make([]float64, len(amounts))
	for i,v := range amounts {
		scaledQuantities[i] = v / 2 * float64(quantities)
	}
	return scaledQuantities
}


