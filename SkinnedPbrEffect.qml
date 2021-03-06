﻿import Qt3D.Core 2.15
import Qt3D.Render 2.15
import Qt3D.Input 2.5
import Qt3D.Extras 2.15

Effect {
    id: skinnedPbrEffect
    parameters: [
        Parameter { name: "baseColor"; value: "red" },
        Parameter { name: "metalness"; value: 0.1 },
        Parameter { name: "roughness"; value: 0.2 }
    ]

    techniques: [
        Technique {
            filterKeys: FilterKey { name: "renderingStyle"; value: "forward" }

            graphicsApiFilter {
                api: GraphicsApiFilter.OpenGL
                majorVersion: 3
                minorVersion: 1
                profile: GraphicsApiFilter.CoreProfile
            }

            renderPasses: RenderPass {
                shaderProgram: ShaderProgram {
                    id: prog
                    vertexShaderCode: loadSource(Qt.resolvedUrl("skinnedPbr.vert"))
                }

                ShaderProgramBuilder {
                    shaderProgram: prog
                    fragmentShaderGraph: "metalrough.frag.json"
                    enabledLayers: ["baseColor", "metalness", "roughness", "ambientOcclusion", "normal"]
                }
            }
        }
    ]
}
