final float HEAD_X = 1, HEAD_Y = 1.25, HEAD_Z = 1;
final float TRUNK_X = 1., TRUNK_Y = 1.75, TRUNK_Z = .65;
final float HIP_X = 1, HIP_Y = .5, HIP_Z = .65;
final float LIMB_X = 1, LIMB_Y = 2.5, LIMB_Z = 1;
final float JOINT = .25;

static float armAng, legAng, trunkAng, hipAng;
static float armOmg, legOmg, trunkOmg, hipOmg; // Omega: angular velocity.
static float humanX, humanY, humanZ; // place of the center of human's head.

static boolean isDeepBreath, isLegExpansion, isArmRotation, isChestCurving,
               isBodyBendingBeside, isBodyBendingBackForward, isBodyTwinsting,
               isArmExpansionUpward, isBodyCurveDiagonaly, isBodyRotation, isJump;

static boolean isFirstHalf;

void initializeVals() {
    armAng = legAng = trunkAng = hipAng = 0;
    armOmg = legOmg = trunkOmg = hipOmg = 0;
    humanX = humanY = humanZ = 0;
    isFirstHalf = true;
}
