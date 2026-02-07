-- Script por Mishk19000
-- Objetivo: Garantir sombras nítidas e realistas em objetos

local Lighting = game:GetService("Lighting")

-- Configurações de Física de Luz para "Sombra Perfeita"
Lighting.ShadowSoftness = 0 -- Deixa as bordas da sombra nítidas (calculo preciso)
Lighting.GlobalShadows = true
Lighting.Exposure = 1.0

local function aplicarSombraPerfeita(objeto)
    -- Verifica se o objeto é uma parte física que pode projetar sombra
    if objeto:IsA("BasePart") then
        objeto.CastShadow = true
        
        -- Opcional: Ajustar material para interagir melhor com a luz
        -- Objetos muito reflexivos podem "lavar" a sombra
        if objeto.Reflectance > 0.5 then
            objeto.Reflectance = 0.1
        end
    end
end

-- Aplicar a todos os objetos já existentes no Workspace
for _, item in ipairs(workspace:GetDescendants()) do
    aplicarSombraPerfeita(item)
end

-- Garantir que novos objetos criados também tenham a sombra
workspace.DescendantAdded:Connect(aplicarSombraPerfeita)

print("Sistema de sombras otimizado para o perfil Mishk19000 ativado.")
