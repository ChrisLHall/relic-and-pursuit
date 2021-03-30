if (image_alpha < alphaTarget) {
	image_alpha = min(image_alpha + fadeSpeed, alphaTarget)
} else if (image_alpha > alphaTarget) {
	image_alpha = max(image_alpha - fadeSpeed, alphaTarget)
}
