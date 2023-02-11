<?php

namespace App\Controller;

use App\Entity\InterestGroup;
use App\Form\InterestGroupType;
use App\Repository\InterestGroupRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/interest/group')]
class InterestGroupController extends AbstractController
{
    #[Route('/', name: 'app_interest_group_index', methods: ['GET'])]
    public function index(InterestGroupRepository $interestGroupRepository): Response
    {
        
        // dd($interestGroupRepository->findAll()[0]->getUserParticipations()->getValues()[0]->getInterestGroup()->getName());
        return $this->render('interest_group/index.html.twig', [
            'interest_groups' => $interestGroupRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_interest_group_new', methods: ['GET', 'POST'])]
    public function new(Request $request, InterestGroupRepository $interestGroupRepository): Response
    {
        $interestGroup = new InterestGroup();
        $form = $this->createForm(InterestGroupType::class, $interestGroup);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $interestGroupRepository->save($interestGroup, true);

            return $this->redirectToRoute('app_interest_group_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('interest_group/new.html.twig', [
            'interest_group' => $interestGroup,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_interest_group_show', methods: ['GET'])]
    public function show(InterestGroup $interestGroup): Response
    {
        // dd($interestGroup->getUserParticipations()->getValues()[0]->getUser()->getName());

        return $this->render('interest_group/show.html.twig', [
            'interest_group' => $interestGroup,
            'users' => ''
        ]);
    }

    #[Route('/{id}/edit', name: 'app_interest_group_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, InterestGroup $interestGroup, InterestGroupRepository $interestGroupRepository): Response
    {
        $form = $this->createForm(InterestGroupType::class, $interestGroup);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $interestGroupRepository->save($interestGroup, true);

            return $this->redirectToRoute('app_interest_group_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('interest_group/edit.html.twig', [
            'interest_group' => $interestGroup,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_interest_group_delete', methods: ['POST'])]
    public function delete(Request $request, InterestGroup $interestGroup, InterestGroupRepository $interestGroupRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$interestGroup->getId(), $request->request->get('_token'))) {
            $interestGroupRepository->remove($interestGroup, true);
        }

        return $this->redirectToRoute('app_interest_group_index', [], Response::HTTP_SEE_OTHER);
    }
}
