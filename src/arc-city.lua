local state = {
    expand_city_in = 2,
    show_city2 = false,
    show_city3 = false,
    show_city4 = false,
}

local images = {}
local sound = {}

function love.load()
    love.window.setMode(640, 400)
    sound["pre_wave"] = love.audio.newSource("sounds/pre-wave.wav", "stream")
    sound["wave_music"] = love.audio.newSource("sounds/wave-music.wav", "stream")
    images["city1"] = love.graphics.newImage("art/City1.png")
    images["city2"] = love.graphics.newImage("art/City2.png")
    images["city3"] = love.graphics.newImage("art/City3.png")
    images["city4"] = love.graphics.newImage("art/City4.png")
    images["ground"] = love.graphics.newImage("art/Ground.png")
    images["city_base"] = love.graphics.newImage("art/CityBase.png")
end

function love.update(dt)
    if not sound["wave_music"]:isPlaying() then
        sound.wave_music:setLooping(true)
        sound.wave_music:play()
    end

    if state.expand_city_in <= 0 then
        if state.show_city2 == false then
            state.show_city2 = true
        elseif state.show_city3 == false then
            state.show_city3 = true
        elseif state.show_city4 == false then
            state.show_city4 = true
        end

        state.expand_city_in = 2
    end

    state.expand_city_in = state.expand_city_in - dt
end

function love.draw()
    local width, height = love.graphics.getDimensions()
    love.graphics.draw(images.city1, 0, 0)

    if state.show_city2 then
        love.graphics.draw(images.city2, 0, 0)
    end

    if state.show_city3 then
        love.graphics.draw(images.city3, 0, 0)
    end

    if state.show_city4 then
        love.graphics.draw(images.city4, 0, 0)
    end

    love.graphics.draw(images.ground, 0, 0)
    love.graphics.draw(images.city_base, 0, 0)
end
