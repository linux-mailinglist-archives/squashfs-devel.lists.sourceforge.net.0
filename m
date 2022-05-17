Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DEC52E34D
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZl-0007Nb-Gx; Fri, 20 May 2022 03:45:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqsYO-0000p1-3Y
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 08:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OQSG90JJ/COqv9mWqt/xzSdYdvO+juHcEsbjP8h9uxE=; b=LFY/Za5+YaZBcQ9dF+yzllVH+t
 Zuih2h/MzwwyJCqrSSOEHZgA/dOjimw5dZGNerygDttfMSVy59J3NDlmA+eeCjkAv/808e98XqW6x
 Y2IIHpPWRbgTELZx3b0dxFXTilLzRNPV/uEFhR5mzmaLaI+cqL6TtXNC1uAFqTjTfi90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OQSG90JJ/COqv9mWqt/xzSdYdvO+juHcEsbjP8h9uxE=; b=h
 X6IEGghzVQpiyFmf2t94EN54yRKmt9Gs5d5NSacKeI/KlldUg/rq6wGLTBZRHrS8DenuL4NqfNcEa
 kE0VQO6qC0oPJcdgueUCblMP2XvskjxObdX9xHu69RzXNJeuCqqoAxaqXsGuDtDzj/AZqRAB41CIQ
 f+cP1Caay/OqxSK4=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqsYL-0004aM-U3
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 08:27:38 +0000
Received: by mail-pl1-f173.google.com with SMTP id bh5so4911510plb.6
 for <squashfs-devel@lists.sourceforge.net>;
 Tue, 17 May 2022 01:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQSG90JJ/COqv9mWqt/xzSdYdvO+juHcEsbjP8h9uxE=;
 b=XcC1UInh58Jl4PGskeuciU5P2OCq/na/kier41kk7nJnA+K4cEl02/LJnIEGZgSSbw
 46fOUd7SGbpqEEc3PJLWzP0fGpCcY9nhGSToswlzecCHtOUtlh3tdUCq9U5gVrQ65glI
 WbHgy4IsWtvjdPvjNZVgKPhcTQK2xWks8//qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQSG90JJ/COqv9mWqt/xzSdYdvO+juHcEsbjP8h9uxE=;
 b=EDs3NLNQ8Wxg/HP6S87JYNzkOoyTuCDmtURULadqLauP6fRRM0C2fjrc08nzAgg58h
 QUOKpkZ6TdZ7tlPf7O+S6VOo9PHCW+76nsb3AAaMcoYNdJnzCpeNLilcCvOGH3R6tf3t
 EiSq47IzJpH4K/vI1VMERLui4Wnhly4WZU5YWppBEa4lyUAl9PYQhh7u/sgjcCPWQmpA
 wCMfw+1AW5SHJ1mX2SUq9pn3KggtrnmQ38gHM2O6vuLT4FP/DYflhFRlDamxA+01QDuv
 igjVUylFWvh9w278KLgcZw5dKZZ1YmAZgHGW5PzYgTN3rFHztULEKntAIlMR9tMD8kNC
 l3DQ==
X-Gm-Message-State: AOAM530n2NEFXc3lPvFmlErdD2ayUDzcpH1KS7YzOTqv3WvYPRDH1YV1
 EE3yf9AUYAUKiIxzxvpeOToRiA==
X-Google-Smtp-Source: ABdhPJzacU5LTBci6tcDoYr6acvV+Apcw/E8uyjMeF6Su/oDlkem6pI1bRcqtwJR4I+BtXjbHyL8Dg==
X-Received: by 2002:a17:902:ce87:b0:15e:a619:4294 with SMTP id
 f7-20020a170902ce8700b0015ea6194294mr21385038plg.157.1652776052116; 
 Tue, 17 May 2022 01:27:32 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:beb2:ec58:2159:9a33])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a628409000000b0050dc76281d3sm8615083pfd.173.2022.05.17.01.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 01:27:31 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Tue, 17 May 2022 16:26:48 +0800
Message-Id: <20220517082650.2005840-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit c1f6925e1091("mm: put readahead pages in cache
 earlier")
 requires fs to implement readahead callback. Otherwise there will be a
 performance
 regression. Commit 9eec1d897139("squashfs: provide backing_dev_info in order
 to disable read-ahead") mitigates the performance drop issue for squashfs
 by closing readahead for it. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.173 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.173 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqsYL-0004aM-U3
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: [Squashfs-devel] [PATCH v2 0/3] Implement readahead for squashfs
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Commit c1f6925e1091("mm: put readahead pages in cache earlier") requires
fs to implement readahead callback. Otherwise there will be a
performance regression.

Commit 9eec1d897139("squashfs: provide backing_dev_info in order to
disable read-ahead") mitigates the performance drop issue for squashfs
by closing readahead for it.

This series implements readahead callback for squashfs. The previous
discussion are in [1] and [2].

[1] https://lore.kernel.org/all/CAJMQK-g9G6KQmH-V=BRGX0swZji9Wxe_2c7ht-MMAapdFy2pXw@mail.gmail.com/T/
[2] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m4af4473b94f98a4996cb11756b633a07e5e059d1

Hsin-Yi Wang (2):
  Revert "squashfs: provide backing_dev_info in order to disable
    read-ahead"
  squashfs: implement readahead

Phillip Lougher (1):
  squashfs: always build "file direct" version of page actor

 fs/squashfs/Makefile     |  4 +--
 fs/squashfs/file.c       | 77 +++++++++++++++++++++++++++++++++++++++-
 fs/squashfs/page_actor.h | 41 ---------------------
 fs/squashfs/super.c      | 33 -----------------
 4 files changed, 78 insertions(+), 77 deletions(-)

-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
