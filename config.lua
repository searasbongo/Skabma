application = {
	content = {
		width = 1080,
		height = 1920, 
		scale = "letterBox",
		fps = 30,

        imageSuffix = {
            --Default is 1920x1080 (New Android phones, such as Galaxy S4)

            --1280x720: Galaxy S3
            ["-0.67x"] = 0.67,
            --1136x640: iPhone5, iPhone5S
            ["-0.59x"] = 0.59,
            --2560x1600: Big Android tablets (Tablet 10.1)
            ["-1.33x"] = 1.33
        }
	},

    --[[
    -- Push notifications

    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    --]]    
}
